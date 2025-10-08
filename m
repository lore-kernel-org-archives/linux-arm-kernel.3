Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA664CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 11:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7avWY48JQfGVo18dxq+IcZTmC3WfW4UmnkHNbWtjudY=; b=HpkqYKjfKpIZ/zi86pblp8IJGL
	ZEwQYyTmO/TCzPqDRTHMu6I42VK4nS8HtSlc+T49fpDNlyx5/zN4LwtyT3wKbhcwe6O2cGg8MDMe+
	KC8fwBF38a+8YlSoDiMDnFs2LNazuIsccNGIf3M3BDci9gc9Cox8PwzexhJVt5IpoyEcwXs1Xzy0L
	yntojcdHh+q1eYe89tciIF23W0gbjZ/tjvunTWfOIst1ikWWG3ERlm71xG6nQx0aX8p1oiYM6NQWh
	onR2RHCM/IqSC4DBlmY9lN5xQHiz4aVux/+7kqwC0JtSMvu4bclohJMNHJq5BAlllfvXkleNDzDjB
	bZj50xTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Sjz-00000003la5-3gNN;
	Wed, 08 Oct 2025 11:53:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Sjx-00000003lZl-0WPI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 11:53:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890N8V026660
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 11:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7avWY48JQfGVo18dxq+IcZTm
	C3WfW4UmnkHNbWtjudY=; b=U/3wO0pmLwppCNGR0R/hKlknOd17qddFlblwFn9S
	+QwVNYSaLQzsoRnZgaa4ZoiPW3hdajJJShwb5f+WHrXVj/NB86tCOe1+W63lDKPj
	ME53H521nr1EyoXD0oGY0HYN8OHN0kImK3vvUtfb6X22p71wd1NpcpVBPsGsB2Rv
	FmZrYRDh47nzj35flLLJl5nmIR+KGQ2uiW0p6V4d9VcWvvJqIhTX8bWrQhfOMh9G
	MyYpqEOqxj1Z9VyuOU+lyvLNEzSn8uGtW5LVkFf8kOFTwnbMRu+sgw7/saRzpq0i
	45bVINT8ZM2lo9DDWk+LUkZOJT/E2sk63z1OBAgzK3mwOA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hj1xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 11:53:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eca7298d9so156428135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 04:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924432; x=1760529232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7avWY48JQfGVo18dxq+IcZTmC3WfW4UmnkHNbWtjudY=;
        b=YwF4IPocPeSzxRUuS2Z/WIRDBtgKYhGYh3AymVynHwmW2T2obi/yyXJa3iYYMDAjJI
         oIt8Ily2D/l/wRXt1QFcsLZkPbRvOG6RvQGJl+btoAI+vHeJaEfSnq1u9Fi1+NnJYWBy
         0AsG1VZQu9HKoel1MqDlYIenwc5+967UEUrW9nslN4Q9EA/nxv5WDnbKbQ86OMyINbIr
         EFMn9AvukJYPFBaUtA447iJx9ygvQ+TThoBeSGwagrk3oI2kNSmlAoNkZH6DbKLB4XsF
         CMuHgfgBhDQx0HwYMxJA8TZMsoRDvIeCwJ/MWCuv4BI8YIbQc6r7fOZ+K9gJdLdD4fDW
         jljQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb4Rk+Xo08iTbdepBDVmhCnUaUQcJASKtoZDRBwCkqLC8FHUdD+Q1Zu2ZAOECIQHKaKGc+NcyTXY2rbutbj3Jb@lists.infradead.org
X-Gm-Message-State: AOJu0YwSBMxutfJjWRUSRXRzA3XFbGlD9j3CdszguNUvo0LVfLE0ctdT
	JgrG5gSAIEiNKsFNDC3V27roFawrISIFEzZXd9eiJbxfVegAlPgDM0ii3nxzYQOwcy3XMBP0I2t
	2D/wuZ7semfAbPEQRcJPxUjmKme4pXcuy4FTE3VMdSOLE1v0Oj++Q32Zjb5ny69NDgXQmZ2+bND
	wkdA==
X-Gm-Gg: ASbGncvpAR67sEV3hMTMe4jwVncEQB7Pa6zKPNnYvrHlVNlNaTqVa0IfceVY95s3B8+
	+OXTUWQoT0vJRZSmv4bfkWnHDSXDZtD6++KYAnLyxK4lzKFNfXD8t52V2CVABLO5oEg3WK8o12G
	maQpxfVIa+BdiWs1SGZndprnvZv3jIQIuLb6k3jDNUwZccy2paq85g2EvzW40OT+XxHClfHVjK2
	Dk1HXO3BRU1N51gMeREDU0rYJIj9fIc+ZsI4Xn1c1OuF0MtOq/31eFi4JQAX0T99Yl6ewPxugAy
	Qm8VZWFA88qVOcrEuI8ekp0uRLykpUsRGrpITdJgDP1ySmBpUO7K5ShkDYppDgNMpjBILqsS
X-Received: by 2002:a17:902:d607:b0:269:8f2e:e38 with SMTP id d9443c01a7336-29027356528mr40730985ad.6.1759924431558;
        Wed, 08 Oct 2025 04:53:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRY9xTDImRzSnKlgoFFobuVyXDP6jP1oDDD+SqAwOBHLbzNiWdEMYhZJqx0MiBZOgzFyc4Lw==
X-Received: by 2002:a17:902:d607:b0:269:8f2e:e38 with SMTP id d9443c01a7336-29027356528mr40730695ad.6.1759924431009;
        Wed, 08 Oct 2025 04:53:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5680sm198422425ad.96.2025.10.08.04.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:53:50 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:23:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
        yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing
 PMSCR_EL1 in VHE
Message-ID: <20251008115344.vwt3j24es7u5f6m4@hu-mojha-hyd.qualcomm.com>
References: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
 <aOVckTSJET5ORY1n@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOVckTSJET5ORY1n@linux.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfXwV5HbTSbDaJh
 J0TZpndgIIZ95Eprt2XqtatMh8bJjDXAAeUtRNIXCBUS1XRA6nFLV7Y01kPDgCm+3JSnCix1DPi
 1CBgrfu4IYYbXlCAMRrt4htiQJA0a2W+iodUgz4vNQ39YgTPTyCVkhGJ6OXVPJzHkpK1RO3319M
 dZ0vtRyF+6pPXl9xXFUdDwiK1IJgkn1DbvlDuWGNoLtWij40tuMb3aU+J89ZZJmkYRoxMF2Pbxn
 w389vgZk6csEJdPeGU1SvLHnPdJlZ1aysu75uEInT0ta/YWb0CQ9wQ3lI/VwoTV8bZv7n6Ai9mW
 tJZHMIRxeo/PPhETM1NJnrxRv15dtKD1N2NuxzfV027CsL59QUXDS7bQ6R+Xar49xjoeYkgvI74
 ZkuZiptBcZrFEu7zwkIresK6bdNW2g==
X-Proofpoint-ORIG-GUID: UxDppxCxMq7B5yoDJOuwxVmuTVC8OlsJ
X-Proofpoint-GUID: UxDppxCxMq7B5yoDJOuwxVmuTVC8OlsJ
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e650d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=61sAA7mvWUCA7UW45uQA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_045353_186594_0ABFA347 
X-CRM114-Status: GOOD (  24.88  )
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

On Tue, Oct 07, 2025 at 11:31:45AM -0700, Oliver Upton wrote:
> Hi Mukesh,
> 
> I find it a bit odd to refer to cpu_has_spe() in the shortlog, which
> doesn't exist prior to this patch.

My bad !!
will fix this

> 
> On Tue, Oct 07, 2025 at 11:53:56PM +0530, Mukesh Ojha wrote:
> > commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
> > initializes PMSCR_EL1 to 0 which is making the boot up stuck when KVM
> > runs in VHE mode and reverting the change is fixing the issue.
> > 
> > [    2.967447] RPC: Registered tcp NFSv4.1 backchannel transport module.
> > [    2.974061] PCI: CLS 0 bytes, default 64
> > [    2.978171] Unpacking initramfs...
> > [    2.982889] kvm [1]: nv: 568 coarse grained trap handlers
> > [    2.988573] kvm [1]: IPA Size Limit: 40 bits
> > 
> > Lets guard the change with cpu_has_spe() check so that it only affects
> > the cpu which has SPE feature supported.
> 
> This could benefit from being spelled out a bit more. In both cases we
> check for the presence of FEAT_SPE, however I believe the issue you
> observe is EL3 hasn't delegated ownership of the Profiling Buffer to
> Non-secure nor does it reinject an UNDEF in response to the sysreg trap.

You are right, writing to SYS_PMSCR is causing an issue.

is it not the right to check if the profiling buffer is implemented
rather than just checking the version ?

> 
> I agree that the change is correct but the rationale needs to be clear.

Will correct it.

> 
> Thanks,
> Oliver

-- 
-Mukesh Ojha

