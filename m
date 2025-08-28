Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A86FC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWSgUZDBbRRXs5XueZsg+EXBRZDVUC3PcZsLkywc4rM=; b=VBNkqzpb7iWG6VgGicv35eTisp
	2sKkzntFJmHyyPyHXNBIch/2T1vH4ipfsXDY3UQMSFJ4zLlIyLbAe5KlbtHnHnwftAwb/w75SZL5t
	WjPq4XD0Xh292/BzWPGOdqmSDuLJmk9PIjBUqZOtrcJTnWAwRlqFegpxnZ0MzC+8Zjr2saeE9nyWQ
	Jb/DlKYplkoZN46GQjWJecL48B8Y4WJj2mxrtQMkR4DkBM3EImauh4l9z+T7iaZ7WNfPYsfZ+ziu1
	liJwQYyVd9mVXLfMUUqTcM/EAlbNt6APTWuIrD/oq3ZKUcbU4Jqu+/FlwXI8uVGX6g99zPzSyTeBb
	wThMnkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNk-00000002SWX-3Fyb;
	Thu, 28 Aug 2025 17:25:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urc3M-00000001c59-2rdK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:48:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S62XqN029193
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OWSgUZDBbRRXs5XueZsg+EXB
	RZDVUC3PcZsLkywc4rM=; b=c7fRh+kC6V1+is+MMLPsca+M8pYXKhQ7fs/dQybA
	YtFh/0xzlQ56+tTa8zGzDIqTzMUhntFC2MmEpnF0eW02L4g/rmWA1Gfr6XFr51EH
	pLfKRnONraCiKonRqh0jqudYPy4joFF1b39PKTHkrX/ya1CBe7raGO0xaGZol5Kb
	Xm2fh02qOTHvE+Fr9BvUZrk6KHZNAUqTc2YEaZuf/+L4CGgezjjuoeEotebMBfYW
	LboE/narpYsG6R2fEsxzhqyVjRKtOG/uoFmVHL2tOK5Gv5puhUGh4Eb1aZkNZzkT
	Ie1X8ObIEyHDR8d7pbP15Zsx14LM94J/h8XYOv5p5gaFIA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w30e0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:48:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70de169afa2so23160776d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385311; x=1756990111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWSgUZDBbRRXs5XueZsg+EXBRZDVUC3PcZsLkywc4rM=;
        b=UHUNlGP1YJtVvvy1sJjAGhM5UVfsCr1umMo6vXB0pzg/0/zUFQMbGPsFqwEmKsp+NA
         /lJp2FhLQZMAObVUoppR9lGGE0EsYllbPtbgFcBokwZnX09xtZSvudYRBQRuHnpWHHrh
         CMj2D7YVK/eRQrApYrp1HxZ9GM0WudE3UYTRQkWTgYZL354cCUB+2M+dNIKRnbGxmRFD
         N4Ri/baMzCDXHVTqEWp+TXn5s+L2CCeABR1KuRSp1zPCN2Em+jZIW8DBdmwwQyb8fTON
         zu0sAJAh0OlvhOvP0AXq/jQFLmo+TJrRv3SgIIr0NAHpU4z5GiNax6utn8uEUdcxfbDi
         v/8g==
X-Forwarded-Encrypted: i=1; AJvYcCWF5YhAx0LDMy0oNqvEFxpi3t79Dg3GO0tugDN21dGBsmxg/N0lgGW3kkKJEfp6pQ10Oy4oS0+r/qzhI2XCJF8f@lists.infradead.org
X-Gm-Message-State: AOJu0YzswJEbjMwqiiGgMoftEi0raIukGHWrG39WaZyJA9FubypqjMkq
	11wBC4uNoVcXxRi7/nNAAADw03/ZKAsWeOHYErLL+IkmaRyU8HGw26+WgCgIZL05MUFlVp8xpyO
	qPh/ir2KU6Cr4DH8qFMhLXeXkSorwMoASziPyDWiigU2yMyTtenuthkkq/H+AMcSQqX7HdwZ/Pc
	VoQQ==
X-Gm-Gg: ASbGnct7zWSbPIxWHq1cZ8zX2ZewpD36z/7UCh2sAXRPyGDQc6VL+jwgPULL1WYx+1x
	cMlAiHvHbgdvWpKDeeEkj7KFwd7a0rOyH3Mc163udkRMspno71oscUFntEYfxwp+uEG9qYZ9bdU
	qL0tuwNchABGKmRlQBvvEDhDK9M42C00ceELrbQnopfTyLWnCJMlG5dok1pLM+t1Zpn7tCwXVtP
	YuCT7zX+PibODwMposFFWROolbMZLFT40Vyjmz2hCV3ltohW3/oGiSBBC3L64ZFsTZNAVKOHP6X
	D2/zvpnvAC2Votw7Y7cqy/kvSaBLz8qkqM3l1KFPmsKSLnf7qTxHia3en1e+EHK43QO/MvPQIrR
	chvy7cX0hBo9YB8JNDmixjK9OVl/MoY4zP3crq9sP89ML50Bsc2Yc
X-Received: by 2002:a05:6214:21cd:b0:704:8f24:f03d with SMTP id 6a1803df08f44-70d9722c764mr136205746d6.16.1756385310737;
        Thu, 28 Aug 2025 05:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENXnZKSLcZXlBr0d0ibJP90HPFaIblcFK7Jg6EkmV9LMI3r6LN3MPNyS79lCEXAK7vPq5+UQ==
X-Received: by 2002:a05:6214:21cd:b0:704:8f24:f03d with SMTP id 6a1803df08f44-70d9722c764mr136204916d6.16.1756385309971;
        Thu, 28 Aug 2025 05:48:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e2687acsm32396121fa.32.2025.08.28.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:48:28 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Shawn Anastasio <sanastasio@raptorengineering.com>,
        Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v6 7/9] PCI: Add pcie_link_is_active() to determine if
 the link is active
Message-ID: <r2bhgghyunfcy5ppjcvxm746kzh7vyhsnbphlw4pj52wxtuxru@qzy7earmlnjf>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
 <20250828-qps615_v4_1-v6-7-985f90a7dd03@oss.qualcomm.com>
 <aLBMdeZbsplpPIsX@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLBMdeZbsplpPIsX@wunner.de>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b05020 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=DLE-xEQoUa54y48t:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=_AprYWD3AAAA:8
 a=i8L4npwzgB_v-bGXBacA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=fKH2wJO7VO9AkD4yHysb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1fkQQccMuqs2
 hu9b2GM/UUO2H1SrDHAv6rszM9YvNO1Bf4XJOXIaDwzSNKLwYdVhC75JCHh9xVBmaD74r+FQvbb
 btIwC0Gct1grSDE/MMT9ZoxtPrnc6vGqOsARc32JBpp4+2fhi78sY+g6mwsxRWVrWZBFLOfLYVM
 n47AZGD/lbVkWHq4bgAfNdeAv04zlq2hoewHawsdUmbiG0dbFYI2Gbglylb3kIZzSOaA1iWQIkd
 +tTe5I13zaEVvDsI3cCuU+kD79anRZ/urOohUZr6J0tvVYxhjtDErq4ivFxXIxL7p9fsZGksL2D
 ZhQ7/7xvqZBm5/c68VXyiAHSyztuAPYiPA89HkAVhZEp54SwUevQbIT497W/RvP8PRpfMM/Ox3t
 921UhUzq
X-Proofpoint-GUID: CR83s2l_tCzsUzl8ugDKt-EXJ4USdv8L
X-Proofpoint-ORIG-GUID: CR83s2l_tCzsUzl8ugDKt-EXJ4USdv8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_054832_730546_F2287A64 
X-CRM114-Status: GOOD (  22.99  )
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

On Thu, Aug 28, 2025 at 02:32:53PM +0200, Lukas Wunner wrote:
> On Thu, Aug 28, 2025 at 05:39:04PM +0530, Krishna Chaitanya Chundru wrote:
> > Add pcie_link_is_active() a common API to check if the PCIe link is active,
> > replacing duplicate code in multiple locations.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> 
> I think the submitter of the patch (who will become the git commit author)
> needs to come last in the Signed-off-by chain.

Not quite... The git commit author is the author of the commit and
usually the _first_ person in the SoB list. Then the patch is being
handled by several other people which leave their SoBs. The final SoB is
usually an entry from the maintainer who applied the patch to the Git.

> 
> > +++ b/drivers/pci/hotplug/pciehp_hpc.c
> > @@ -614,8 +587,8 @@ static void pciehp_ignore_link_change(struct controller *ctrl,
> >  	 * Synthesize it to ensure that it is acted on.
> >  	 */
> >  	down_read_nested(&ctrl->reset_lock, ctrl->depth);
> > -	if (!pciehp_check_link_active(ctrl) || pciehp_device_replaced(ctrl))
> > -		pciehp_request(ctrl, ignored_events);
> > +	if (!pcie_link_is_active(ctrl_dev(ctrl)) || pciehp_device_replaced(ctrl))
> > +		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
> >  	up_read(&ctrl->reset_lock);
> >  }
> 
> You can just use "pdev" instead of "ctrl_dev(ctrl)" as argument to
> pcie_link_is_active() to shorten the line.
> 
> With that addressed,
> Reviewed-by: Lukas Wunner <lukas@wunner.de>

-- 
With best wishes
Dmitry

