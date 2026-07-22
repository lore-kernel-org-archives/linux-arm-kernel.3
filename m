Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DA9C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/sjeRpn9BssHS0FCtGdQxM5xUeDnRf/+QPldCey/10=; b=j9UtQ8Ms6konhhakpRqohGAA3r
	HcesTO1AN0j21xQ696DVSIZfc9gCIGZzv6iF+CFk/5mzLxaryhdBoUN8bNpj+lEbpAgfCFFD0b2Pl
	pVQ8VxoCmZD3LEHqijRiiQ4qRSPZFYRbrPchbD8wDmYnBWDX1EJI80+vvIl1foMxBdN7LD2QN8GVM
	xnx1Xwi6U3HJgGsIXqPw6nZN/kMpA3abJM30YkvEcK5QbjTu+WE9Uk/ThSTlEQZkdAvZ3rpXhJI8L
	YrfgR7iKXA5xsTJxl7MocwygS33uYdnBp2c0+MC6/7HYgUE495creo2gi9W5eg/DvK2hW9b2WB6He
	5ZrO5KSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRZ9-0000000B6B2-24qG;
	Wed, 22 Jul 2026 07:40:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRZ5-0000000B6AP-39Lt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:40:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53lu03767875
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T/sjeRpn9BssHS0FCtGdQxM5
	xUeDnRf/+QPldCey/10=; b=a6AiptuvNdJiTbm64FRiiwTW4/xZa1RuSpl6OVUl
	4QPetK5kihgfJFPFKj7iMnQV4q3npN1dTs81MkXarbti4nzalNQJQ+vnJx3+d5ja
	Pqbt5OQOpJup6Z/x8DgC9EPu21QubXNJKDRBnwoCcUOmh434Ow/ZlIhYH8EP5OYM
	UkHorDzdJUt0fjixZJI5/TfAViZG+fUuCCMMpF+uPrRpsoEa55J4MPAw+4d9l0Ac
	H67NO3iFRdrZvIKQk7ng8oqe2ShZ3PxrsOpSjC5eOuxyyvaxUuQG+qiOhYL4mpzg
	KEiZJDbfGXRkkJsFq0iaxNnk9u+Srd4hjO00MJ/PmUtOuQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4rwwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:40:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so5641514a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784706026; x=1785310826; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/sjeRpn9BssHS0FCtGdQxM5xUeDnRf/+QPldCey/10=;
        b=Gwg8SRVNYvvGBHzJXBFwVENjZieVZeWulNCALtrrU0Zk6W3qPo93r2bsgct7FX1NK6
         y7Mq7tfurVsf3uuHU1j5bgAj9btwRf9qahB9PqjrT6ZiD1abYxSsrQamBQyi1VNoiS2M
         CAum/f81opTqsIZYKoLYtfMsFRKj8oqpru+wP4I33CHqPSycjSKWVFAQrSBcQQ2DXLiD
         CP5E2FRwlIVsIBd7njURBmnj34pJ6Co/+o7FLhZqNEugfE1lxvQoqlKeCzFcqtRcEbUA
         kAG73lPNjPZGlyIFRiNbHNJuMzorBD7s3k2Gb5XMFOO4Xqof/x+fN2zu44PPnwBdWqkT
         NZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706026; x=1785310826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/sjeRpn9BssHS0FCtGdQxM5xUeDnRf/+QPldCey/10=;
        b=bPYi6Wv37erBlV/QDOWpYZ0WnN1UL3ZoNc7qzEpyZX08u1evEYqPU6NOWmF4L2zRIm
         d61R6lNvhiyLSPxCCq0vwe2x8sf4zHP+DNFZKEnqFegSw35LRU5RY4lX7FoEjdrG0n3U
         +nCg9Y5xf8Fq3BHTozbnHRzBUDouaxSs6Ke7msG+cUjbw0sYZreGiD7mD1yQ/WrMmMlz
         yzm1O6aLkqhczAkWRywj+zevK4AiKQbGAvw2i1SXVsBr0G3GxWirW2f67uMPXTWFO3eW
         7hOcYhDq48KtH3d69jzB+w5pR+ZCgesBjteBwldYAImVRWS3PAgrle/O/cZpMpkWLuno
         5+Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqvyP0SAMNtX2lvws2mILWvNXGj5elB2kDoqgpHXIILvWdRBCFDdMf0hO6khlc4senypt8YLkQ95zSLtrntNEZu@lists.infradead.org
X-Gm-Message-State: AOJu0YzgZuHMUDVTHXvhTLKZRzcKIMYEsQ//hSqcPQin8hrUWup02nE0
	nGCcyXpQni+Tq9HWqVgDtljztuxmzqyM2/jnKP8BiNaPaEJWm3P+eEHnYSa7kVJZiG+QR8McmlR
	2gcRc22AWHn0jMgpDA+fK/TpHnS3b7L1rX4D8ygQ2SR6sLbCLPtyIHBTrfQJrVeh47MuGpT1sBP
	//J26YruXd9X+A
X-Gm-Gg: AR+sD11gXdwUkaaI8VUg5tZ4LRl5pGuMDgW5l6QJoExZpxGaljcUpmUjfBdIGiGSF2f
	vQPF6XyF0QIR+tTwC53ylIshN1rP52nRW+7xcpVoLYYD2bMcBZ+jg1ASiO+DHGq2MdorQ/9uNk/
	PivIw2enROYRBUIhqcZESOYKYpV0IDlrotbdKhBVDR25Y0Ujnwgp5d15bL1oz6nZBB0Nj545ZxO
	vsjNSzSsNuNj34CZyqVuTdeyo5jyfCf3+ThL06PYZ7G1Iy9zrvKxEsToSx4w/ffBeja+hmOPOG4
	yI7PwIZ9KKE5DtFQZxB1TrfCQ7r+iLXWqenAx7LJoJW2uTZ4SeEJjqYEQLI3CLz6hWVszZWE3LJ
	Cn85C/B8n0JBTlxwpYbpc/jNqLv3/0aMD8g==
X-Received: by 2002:a17:90b:5844:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38ea37961d2mr2544843a91.16.1784706026119;
        Wed, 22 Jul 2026 00:40:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38ea37961d2mr2544812a91.16.1784706025638;
        Wed, 22 Jul 2026 00:40:25 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a7738sm3935997c88.9.2026.07.22.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:40:25 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:10:13 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Message-ID: <0c55125d-5304-415d-86c0-a589c612babf@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-GUID: ofFzaltPIGUJCaf7XDxaRf8C07R0JdYv
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a6073eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZcGSZn2CXGzCaGrIrKoA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfXwaWa1inLYgEF
 XXsHr5U71kfbQV/Z5CbAAH6AiZVzfCrkJDcRY3a3ysZ0csOoL/7U3j1UJwMjUjwinAhI6WWLA2l
 EhTPRD9tBxn7FjVjBAKmrAheewjS4xgMf6rVhh4UVtgYgGQhd3h74yy0wB+4rrrpxCnayLY7dZ3
 KgkAW1cWhq41G3lq1BcYkprASlBblYkLjaZWuE8nGvvt9x+bYfRuZfcNlV3lQWGU6v/BMscnQVi
 2NI4mfh5mTWSDa1u7B65YmXSSa2OhPcD39Z7tZOwGUk85fQmsPeeatNMHyvgkdpEUGV2gK7gdOe
 C0Aa/SdWkmON8Nt9rnFyfP3+mApffvvBSeuqbmZFm4YlCkHLzT8Z8cFZW8XJ4I9uVKp0bj5rGMj
 nFwhiCmGG7IjpQ3mJOx97946jHoWL3ODSnmUomXMHL5O5Tco/9L3zsHjw8TPgKa2LbeuPmGKx88
 HxeedZzms/8FEA1pOGg==
X-Proofpoint-ORIG-GUID: ofFzaltPIGUJCaf7XDxaRf8C07R0JdYv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfX2llD5jv6ot+d
 lkX5ucOolsPrwnlyMvRfFgtScyJVscynX91XVHPbNXdQz7a3qbMVfRW5zHbWNWWshMhQbOgl/H8
 Iy5jKdmZBNGphcvNY74v5Nl8rE3iY5s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004027_799233_D2EBE951 
X-CRM114-Status: GOOD (  23.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
> reboot-mode based drivers can define a reboot-mode by adding it under
> the reboot-mode node in device tree. This limits such drivers, to define
> any predefined reboot-modes statically within the driver and creates a
> dependency on device-tree.
> 
> Extend the reboot-mode framework to handle predefined modes alongside
> those defined in device tree. Drivers can now define their own
> reboot-modes and register them via the framework. A centralized init
> call has been added to the reboot-mode framework and adopted by
> existing drivers. This ensures driver state is initialized together
> with predefined modes.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> @@ -195,35 +264,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  			continue;
>  		}
>  
> -		info = kzalloc(sizeof(*info), GFP_KERNEL);
> -		if (!info) {
> -			ret = -ENOMEM;
> -			goto error;
> -		}
> -
> -		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
> -			pr_debug("reboot mode %s with zero magic values\n", prop->name);
> -			info->count = -1;
> -		} else {
> -			memcpy(info->magic, magic, count * sizeof(u32));
> -			info->count = count;
> -		}
> -
> -		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> -		if (!info->mode) {
> -			ret =  -ENOMEM;
> -			goto error;
> -		} else if (info->mode[0] == '\0') {
> -			kfree_const(info->mode);
> -			ret = -EINVAL;
> -			pr_err("invalid mode name(%s): too short!\n", prop->name);
> +		info = reboot_mode_create_info(prop->name + len, magic, count);
> +		if (IS_ERR(info)) {
> +			ret = PTR_ERR(info);
>  			goto error;
>  		}
>  
>  		list_add_tail(&info->list, &reboot->head);
> -		info = NULL;
>  	}
>  
> +predefined_modes:
> +	list_splice_tail_init(&reboot->predefined_modes, &reboot->head);
>  	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>  	register_reboot_notifier(&reboot->reboot_notifier);
>  

This splice here makes me ask why we need separate API for registering
pre-defined reboot modes? why not extend `struct reboot_mode_driver` to
pass on the pre-defined modes and let `reboot_mode_register()` take care
of both OF & pre-defined modes. 

The semantics of `reboot_mode_reset_predefined_modes()` is very
confusing. It is not clear if any client driver needs to really call
before unregistering? The unregister it self is cleaning up these
pre-defined modes since they are spliced.

Thanks,
Pavan

