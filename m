Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE6ECD040D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zu5KsSSAYr8IXy49RPMoofLX2Z45PWdd94vhBIDqqE=; b=fsEFPBvmjRhuxCeNv2DMXAkZVV
	lMzpGYUc3uJXQoF/41KwMC9wyGQ7WzjzNzUFatH5x69tgbYtKTvwsNZaGNQZbqDFjnBPSG97ZL+Az
	vo/febWSn91ggeOCae4PSDz9zxa3/18ouwdQltjubpdxF/FjneoQ/UalprIGW6w+ozyrL7MtJcoaW
	Zbe/1J1Hvbd6QmvGKnI6BgmAEb7Jix9Mq3OtWpaCxjIDwsjqJR2I26YKd6Se6KimJVPE4tZFaxAwe
	dHXdLTE/50eHphE7aFQsfsPAnNebqEJEdY34pCyA7aV2xfdhMMG/ptfw63//X3fizkDpxOty3I9Cz
	r+rwpfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsAm-0000000C83W-2Q3E;
	Mon, 05 Jan 2026 21:31:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsAk-0000000C837-2avA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:31:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605IX6Cf3541351
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 21:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zu5KsSSAYr8IXy49RPMoofLX2Z45PWdd94vhBIDqqE=; b=lFUJ1iqt2RX7MJd9
	d/lofAm3V64RkHAtaYCanL5/o5QFTL5LQfLkcDzgDFaIQ+VS1q1PeQ9eoxYwV9/i
	dt926QH7MxKqiz6IQL2yDVa5OqvgaSHhN8HpiJQNw2OEAxMX4jXBOeYXvqKENBSj
	RfbrJW8bZPNGVrUzpaxFKZ5XSGxykDtw5tQBbeOq/jCxwZqRJ96MZwJsqguHw6Er
	Y6nR6nEThARXFInszk08xj2RsXAY1B+TtzxoGeXdJZUAe2ggBq13paSpVQOSFbql
	ET1gnVfGF/nY8cXCxUWdgfRdTKD8ZbN5NN5PuxJpSIyjD4U8c2nhU0ovkHRxLQbZ
	pXmM8A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57sjyp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 21:31:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5e5270ec826so274660137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767648688; x=1768253488; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4zu5KsSSAYr8IXy49RPMoofLX2Z45PWdd94vhBIDqqE=;
        b=bdJCcnfOYXn17a7BstIe6hGEw/peMLgI56Iy1qPlEqEmkbO4tprAid/MXNBKSd4gYL
         0fdCmpQ4tJq0Kt1Zuntn5J//Tca+L9kvZ5ZgQFTYhD9H6HEADXOaW4nDVIZBiaeTUQhb
         Jn0ZK3UsAcaQhktEOH++9ewb4ZqZJ0UfmaEMDW08x8JClZFlO/Myk9r/AvVyp0Z0Pr/l
         7m+UEqBK92FFuCq147cxPjxaX39rHxbqmmwDYM9yvTmTlbfkGpl+OjP1QDM8pvVKsdPf
         mtU1DgoPKVIQbxFBJ0BSOjwCQlqZCYfo1N/uCFpdHiQ38m3sQ6AQkh1zBUgDu2ofmLxO
         1qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767648688; x=1768253488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zu5KsSSAYr8IXy49RPMoofLX2Z45PWdd94vhBIDqqE=;
        b=FctlIapOh1/Ed7wTMyaW0etadO/nzfEFT5nX3yzIIGtgORWKQeaKEdy37oB/UZ7vdW
         /5r5k2vUpMR/GDUV5sPJum3fsdkAClC7plCWdV+iRbGrAlJaxmby9kEFbGa0ApsUFdql
         T+UiI+ZGXffCh4d3gZqJj9CLaSFqkDyk8CueQC065vdrjpWmMxIZG+lJvh/OUv7b470M
         DhLcR9dEHZMt9xMdCqSNB/1ra1I0NbYTpBK1ya3r6tL+NVKhheBj7C/GhQxQiZcEcN8G
         SRm4duccpf3TbWTM6kSP93tRVxzP2srdm9ebMml0u4+UfYuuH0/cnbG9XMWBu/sVfwNF
         rIRw==
X-Forwarded-Encrypted: i=1; AJvYcCUKNcefexGuYE09a0RFV5c/BUvoncC8O2S9HeaWUFEhmtJAwbq5s78XTRKb0iJd2kmxSrBbY160k08KF84e8PSS@lists.infradead.org
X-Gm-Message-State: AOJu0YxAJKeKDFCe7cEzSNSPt+jQ+L5oMnCP4M7210agujhQEWU7Rkdx
	zwq43+FVnqV4pDgMuv4aizauyUS09VRzfgBzrYPxx4u8Ko1AtedwHRb8CNA8PQSI7oON03UzR3B
	bKke6B5XrYWljTYanezUfodz18oszLuOWArfsaelXD88x7eKdqmIrwDCeyRQgB70DiwwrLLGAby
	Ejlw==
X-Gm-Gg: AY/fxX5nRF9/LTe0BN3NGHD1+pC/MawAIlvkJfNNMVjU8XVXPrgenbCFacTLpyGnExD
	6Jx4BJTqmLNnygQ6KsHM58jcaa2kQs2ApbWi/ljrUATTEo6hd+sNWj5ARV2L0FrYI6rzTGv4DZD
	k+TzViQUlcrz3dagtV2/0QQFzsNGP8YQ68vR6kptvBAQjRjgW2x24nJ8EbLvozRfmEIfVsuHsAh
	mJ3vDGGC14sB4RAV03API/07fVw26/0JMtWD0k13A6AWtHnXHBlcPRgwP/QOE+SX8JMg6nLkonx
	Y8HAStcr2FEle9Wk04esy0Dhiwru6PHNeKC6T8SdD+XsBVXAZjjzZsktgVets9lMDqkNPApgYIw
	cYy2+8FPJ49CAEKUC7Qxxh+iwlea0sYBe485oHM5h332tWfscu/ztMlXd30gZb4I+cqJq/pfYH4
	JOxMwxYlWlp/8XfYY6f22pGh8=
X-Received: by 2002:a05:6102:2912:b0:5db:e851:938e with SMTP id ada2fe7eead31-5ec74318ab0mr280765137.10.1767648688155;
        Mon, 05 Jan 2026 13:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHN6D3L01UfV6GWimrbBRPwGxz03pI11NWXb7fzsx236R9fU8MdRrZ4c01w5FGgeM95dAMb7w==
X-Received: by 2002:a05:6102:2912:b0:5db:e851:938e with SMTP id ada2fe7eead31-5ec74318ab0mr280739137.10.1767648687644;
        Mon, 05 Jan 2026 13:31:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8ad6besm652641fa.27.2026.01.05.13.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:31:26 -0800 (PST)
Date: Mon, 5 Jan 2026 23:31:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <cvmtn335gwnl6rvmlm4vgyablsj735rknga4ffv53gpk4k7d6g@tt7ebuyusocu>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
 <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695c2db1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gjb6EQGLQTTv68HWFF4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE4NyBTYWx0ZWRfX+VzXg8lY1FPW
 Os3CAppu025vT3fe5O6EOaRCeDNyRR4VALs2UxwmKjS2DB42hfxsUuQXn59J8ZOgas0zwN1huo+
 aGOKTY521mT47nKtsDl7qyb2X41+eIBDeARfLX9hemhGyyBSa4TweIyN7WCurBlpdVTUeIiAkWf
 LkY3LBFhTRECFepGUmT2QCUHr2wPDqUnfbbeBGEnHz8WNsW5/T22coX+WjXjGEEn1smeb5QJw4e
 XfyjHXGPMwThX+bQvEv9xqSe92+qTiHsNzxMRYGOy8GNtW6UePVWO3RIPP4rkM7ZEWCikap3/t/
 evk0H+IBuhrnT/mK+aBCzTJ5en4jL4q2lERTfBwSQ/tjT8TrEe8lQWTiiJMzSw93MGJt/OPjuyy
 pcyvpt1JNywt5mJk2yWmNQEfvMP25yzwKrNmeSz3ZuNmrPWXf+obQXTLueoiRVRT4KInRtv/tPR
 n1yZ3ithLbEVH4Why3A==
X-Proofpoint-ORIG-GUID: kq9zifD_4DPsNj98qHmcT9Eyft4Xx-t3
X-Proofpoint-GUID: kq9zifD_4DPsNj98qHmcT9Eyft4Xx-t3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_133130_668077_7966F888 
X-CRM114-Status: GOOD (  18.89  )
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

On Mon, Jan 05, 2026 at 11:46:40PM +0530, Shivendra Pratap wrote:
> 
> 
> On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
> > On Sun, Dec 28, 2025 at 6:20 PM Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> 
> [snip]
> 
> > 
> >> +                       pr_err("reboot mode %s without magic number\n", prop->name);
> > 
> > If this is an error, shouldn't we bail out?
> > 
> >> +                       continue;
> 
> This is not an error as per original design of reboot-mode framework.
> The code as of now says, if the reboot-mode node has an entry without
> proper magic value, ignore it, and, process the next.

Then why are you using error level for the message printout?

-- 
With best wishes
Dmitry

