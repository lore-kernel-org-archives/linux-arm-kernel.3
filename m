Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DDCC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 05:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a9JgcopP9bJ5yF1Me7vfccRLe+8BXkEbBw51pVceW8=; b=ZCYYx8SiUZY5s3XaWgnaZjnjl6
	Uv/NLe8J+SOZ9up+Ts7vqXQ7BEA20gs0XEfiv0Jv+mcyP4OgFdfDAMix5EOpmD3wSpFbOVZAvWIOV
	+unpeQecwK2PA0tajEbPS7eOjv0u96fTIV1YWxksu/K98NngQRmUPfIg99Uzivd3zDIisB2bmPXeU
	WzcyfiDe0X2jqW4dfw32cAsGz7jWgWSPXJp+8htZI5DTsx7o+1d81WxiDxto60eZZ3n9/zPPyrqJR
	hdMBi9CcPnvvn3Ec8Jv+HNHhIUC+vgV2wXxWc/3GXTPSFGwncsaNRWCRcDyiuzwtmjnFaBSVrMIfq
	43pfh6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN388-0000000El91-2vdl;
	Thu, 05 Jun 2025 05:27:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN360-0000000Ekmy-3oOo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 05:24:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5550K9BV018268
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Jun 2025 05:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1a9JgcopP9bJ5yF1Me7vfccR
	Le+8BXkEbBw51pVceW8=; b=RTox0ObqdSLNR5F8asiRpPLHATO4WAFotd9IbWWM
	/Lcf2ZR2kFLHkaKRMdSv2q4ftBQC/CjKMEuuv0HoB4nudfoFyp1Kf+sPRaVvor4O
	2lwZer5akc+gE7QGMyK2fsmh/IySUhT8GaU9GOfyx5/bUgM189yuu+pD/IT3FXl4
	3R0/SQD1nCAptg5c2MgX+7ssKO5eZCgmASLqFVS0VyXpXiVRoHGSUlqZvB5w7Gp+
	i7alpuLT9V0xPdSY5KS8vdAFMtpSJbzfPOkStceSW2aNv/Xz2/H94/Nb2AJSmRPz
	n6Ju7powBABYrI/9whDi5XTkm9ndIeOc6lwlXR0pumhPzg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8u06wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 05:24:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so349538a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 22:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101092; x=1749705892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a9JgcopP9bJ5yF1Me7vfccRLe+8BXkEbBw51pVceW8=;
        b=akbb3yWivK1nOkBkOEsGoYRNKiut0686IdQxYxhK5l6Crm8+8+wcHNCcYWC+ck5KKB
         ql/ZwJvGg+IBJcz29nNklBTpnVRUvM7PFkPd76jMjx4HEIBUh75obOBI9VQ7+Iz0/YYt
         3qe05qClnBsLjR/83em85T7FmGY9tXaEjNulxBusk1Jy8OuR+B6oQ65uyR8bH8UIHQLK
         FFHm5enipQdsQZkyP51rYz6nBgm3AflczvEoukFdqKsTVOGbENwL4CefRocygnaaPG3o
         0SzO/bcurLDp2cjzJ8dXbaKMld68XfqdaJ3AJGVPfgr9qZ3fc9tdSgtZp1WueXGG0R+Q
         G88Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzjhgWhmrJCQr8Qva1NXNxVug0THtx/YOq0k1qMQGqlyC0ItFiYlBYAXQ/bNXjhWuALePK7FaxxFU36mwl2evI@lists.infradead.org
X-Gm-Message-State: AOJu0Ywql7MYECtf/u/kLzOt6nw/ORJ9SNxyURn8v0C34WVc9tEkPdy+
	JxqbpO2Cb3eoJ8DckRDv05quj6c/U3iUsnE7pvDsldhNBFK3rTmM+pPswWLjx7LZrPqdI3uGiQ7
	MRPIDKgB7RfNY7UwHslxzVWhr0xYRlx3FLtL2cUkG0fdVVp9lGZcLiMv/ZDobnRBhki8qBLtlon
	ePLQ==
X-Gm-Gg: ASbGncvdsIrqudh/fybz/68ImTpI2npZgA6HJMSFLdi8O6L+XTUjs+y/TH6yYN3+0rX
	rkxpKDpNHeYE78kses685MgLRxn3K7s85HH8xm4vHKojaECVG2N5bN+QhX4ThEBYi/wUrfB1Exv
	xcLWT/tuf9LIuFvh+73DpbyD9s6YkxZubG6EXbg/e2ZL53V43OYGp0y68LXwIA2wMYa3CY1MSvx
	xBZ1ReKeys/d5F3ySZH2DsZrEO/Evm+o8ewgp1G5kE06kkB33LHjbaXERdPucAkDlkmVPB3/6En
	wVQ8pOxNGWBM1UrEcwIizRimIX5k+b3EjbugKD4AuQKYQQEU3dMFy+oTEws=
X-Received: by 2002:a05:6a21:3287:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-21d22a6cab8mr8581882637.7.1749101092399;
        Wed, 04 Jun 2025 22:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELuWY/1bcdQXTlNAC0FeBkJQ7D653GZ5CNEp7sdXfBrnquNDS8cgkO69w0uf0qsyvNLiEZIg==
X-Received: by 2002:a05:6a21:3287:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-21d22a6cab8mr8581844637.7.1749101091990;
        Wed, 04 Jun 2025 22:24:51 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96781sm12040801b3a.29.2025.06.04.22.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:24:51 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:24:49 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com
Subject: Re: [PATCH v4 1/5] arm64: Kconfig: enable PCI Power Control Slot
 driver for QCOM
Message-ID: <aEEqIWSU5P9Xp9J/@hu-qianyu-lv.qualcomm.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-2-quic_wenbyao@quicinc.com>
 <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
X-Proofpoint-GUID: UUSQJlPh1gnkMxwwEtfPA_Fz3uBGJPw9
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=68412a25 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=yafonziSkLk5LdqN7hYA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0NSBTYWx0ZWRfXzVcqJrJfoPS+
 nON23XfPsoObsSPolwucGp9OpwlNd3vtVo10Lhu/XE+LnN//qQOb0vWuFHmp/njzG5xqibeURp0
 sDD0KCtHTT5enELsEp+UtZAfvdHQZaloL2PH/zIWGCv1f/yl+pROG22j5nR2zT6xa7ccad6Yjp4
 xvlRSnmXlzI+OInlFSPZko733+HaA6B3xeKeI3ZRu9e27qPWuBq+PemYaE/D+Jy8HpCIs+qPxUr
 wCGt1DSDX1teGiFqwFP2TQelL6c+Yf63VJV22PKxxjuQ6P3FL4vgPteZs8xlEmFKNEhsz2vF75L
 WTV+2keRsiX+3RPa4exJ+1o8IWUuzNYmooHKx3XscOZbHwJtpmOIxXIp7iBE0udJcpGAjzYP6tn
 GXZMDEBJQa0aj+8VT9jQcjANvI9KYORF5PvsvDK1GEjsrLtiWhSfPPeg3QLU1+a5Kf3UYF+2
X-Proofpoint-ORIG-GUID: UUSQJlPh1gnkMxwwEtfPA_Fz3uBGJPw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_222457_137204_4C1E3964 
X-CRM114-Status: GOOD (  27.25  )
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

On Wed, Jun 04, 2025 at 03:30:22PM -0500, Bjorn Andersson wrote:
> On Wed, Jun 04, 2025 at 04:02:33PM +0800, Wenbin Yao wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Enable the pwrctrl driver, which is utilized to manage the power supplies
> > of the devices connected to the PCI slots. This ensures that the voltage
> > rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
> > correctly turned on/off if they are described under PCIe port device tree
> > node.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > ---
> >  arch/arm64/Kconfig.platforms | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index a541bb029..0ffd65e36 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -270,6 +270,7 @@ config ARCH_QCOM
> >  	select GPIOLIB
> >  	select PINCTRL
> >  	select HAVE_PWRCTRL if PCI
> > +	select PCI_PWRCTRL_SLOT if PCI
> 
> PWRCTL isn't a fundamental feature of ARCH_QCOM, so why do we select it
> here?
> 
We were asked to select it in the same way as PCI_PWRCTL_PWRSEQ, following
an approach like:

select PCI_PWRCTL_SLOT if ARCH_QCOM in Kconfig and nothing in defconfig.

But to be honest, we didn't figure out a more appropriate way. Unlike
PCI_PWRCTL_PWRSEQ, which is selected by ath11k/ath12k, PCI_PWRCTL_SLOT
doesn't have a specific endpoint device driver to select it. Would it be
appropriate to add "select PCI_PWRCTL_SLOT if HAVE_PWRCTL" in the Kconfig
for portdrv? Do you have any recommendations?

> Regards,
> Bjorn
> 
> >  	help
> >  	  This enables support for the ARMv8 based Qualcomm chipsets.
> >  
> > -- 
> > 2.34.1
> > 

