Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E42BF53D87
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hl0a6sUmp0DkvLU0LqWwqkjbWyZqCa4rM7hGljELxLU=; b=uqemD9cqp20C7jNvFyyg3L0TH8
	T0mF71DcRRJDJ3+/TUqfY/fl6pzsBoI1r0pCUn0c9+krQTVdnFSCiQo65jtPk1mFM8di4XodhuJD/
	6BP7bCFs2/cfhZ0F190hcAe+G9A2lHdLzh2Ft/6JGSYVcSmB08liyorNVqZBY0IkI+PA5sMGJN2Gg
	YNgIcfYYltNbmXkIBh4hXulSpNh/qiUsqlBPeMegkJk7xJHB049QCk3icE5AdOKcz4jjWB0dxVGxW
	VPeirK1nUiGBbbqxfZC105AAJGqkCpbbQgwQk0B2nd2k3Sj1y/JmZlIhnT6t+Wap9BKnen5Kl7zVp
	Ql9NCVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2D10-00000004hiA-2CLw;
	Mon, 16 Mar 2026 18:50:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2D0x-00000004hho-3yEn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 18:50:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCX9kO1621677
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hl0a6sUmp0DkvLU0LqWwqkjbWyZqCa4rM7hGljELxLU=; b=YeiJiSl5ylcjuBqo
	JLCCCjdfyaY0P7hSHeH9IsIXsowGuZ7DxN4Hw0YYDQAfI5pKIsvUrizF79RnYmA3
	xKqITLewGKcEa6O7/m5ptwZevfgf5vi8dU9mxQKcf4xE3fwUee4s2YVwZC2t5PRp
	X9EbLF0gW0P6ZfJBdslzoZzfh/1VmhUfqNekM1VO9F991759geoCm/DY9HC+GJ39
	bFGi3McuYPJ2rYewW580PglNRMztWqV9a604wjvJ/ixY7SW7Y7QXt1PfTdi0L9zY
	NyLtR0ACN+inYv6Z3RgaP7jAmTbrFwvlZ2bxwI8fMoHknW5edwWeONwWeFmMJPSY
	KTKvVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyehd61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:50:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso3817326785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687004; x=1774291804; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hl0a6sUmp0DkvLU0LqWwqkjbWyZqCa4rM7hGljELxLU=;
        b=HHw3o72vg3b0HbWNAGmDzSBlcnM+FJiJeCSCo37NLd8ugyfM/tCX8PXvT0iSHdMwH7
         gE+HetCz3ucedzO5LuINGEKQcE9OEQgG1aDKiTABph5oNe7yBWGrw/EaMRZIBAxqUqDE
         Jp0hDJmZiDVFnKapiD1VKgb08UmZh8oNSXNsK2QVtK0cYsezitNq7SIsVyYPxQ1CdBHa
         /E41NfwEbISvsIq5McCM+F24wiwnrxGJlp3jJhd/rNh/ricUVECckRKndyBOMCdT52nW
         SG4LSfBIzJbslVe08fB5X3yqzZH2rBQwRloBdncjYLic0uw15VxXAImpoHCN5n9iQ4rO
         qIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687004; x=1774291804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hl0a6sUmp0DkvLU0LqWwqkjbWyZqCa4rM7hGljELxLU=;
        b=NxkxYNz+fEijfJnzslDd2HUGWIf3v0pAxt6NyaFLZoO9bUyLhxHiSmBW8f9ZwfWsIK
         dbsa/shlC0yFpAjjP0tAzNDEVOz5D4/FHVBok10my+XCuX4Qdjzw8LYOwoez1NNpy/P5
         7pyub5u4WIPIf3kQAsbBbHyv9lGmuZR5lLybGZFTWAsoymxFiTL939VOx3J4ksxSqLI+
         OAEoHljFZASrowgs/vFxOe1OXQaeixKXZg2njBGDv4TQnidcwnGOskoJPOkDfm4JS16W
         bpa2btc4gU2RaIVXzpj8LyPPmlnWlyvU7m4WJTDpPZnZgDwA4GbsiZIoOGPiy+rwRuuK
         AkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOToKIBq45C0bvy+sAqMdlNRMbLb04zHaFuVdsEYi3/SWfNEqc3R5pqVm/MMkUQzsEqly6BqXJba+8O4+SLfLj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2yELdMfhimgTI4t0ZVwwgd6zhiCG3swr4O1da918rh44UERDF
	QwWuqzLzwDN5bXamETHw4vn+ltjV9DphVJtCjeRMNTU/GoAOy1Qrz95caSwdoYrZfO1c8JQazdP
	n2BNVgt1yH3yaJFVvObQQYBosp8p569uRRbSGpqiBCuePN0t6dbrh/uxhRsCx+xSDLHd0zz40K8
	dpSQ==
X-Gm-Gg: ATEYQzyis535shBE5dxX/bKUreNG4Ek3KehfLCXm5Lo5W6ZfeB34PeYz1D0SY40eAaE
	FdSjj+xOLsZh6n4AL6Qh6A94Bqq5ppTJC6PzF6/9nHHQUKLUxbQ1/aCorYKjm7KLmXBndPhu1Eb
	GuxBbHgAuANyCMltR3ArqQnyWwzEZVhrJcNdZTlRrl6sUw7xWn0aWeynpl5r6k0P6Aoiva7/rXv
	ZjF3ztWHFemrj2NADd2onNhhNZQwuHKCBaQRXZDyJ67HBcFitMeDd8QRZ29QXkIZBr1xjL+UX9c
	6OpH8uVp01r+bqS+rn5mORqjX6JCCo89/PIGXZnavFxyvjoWOqkfuhC/ijZUPU5vtJ2umeIBfML
	olgbKIiQ7K2b3i1MyPf1p7Dfs3kSNUKjX6HC+6QRF9XC1krcG1YZMUi6asv0Utlf5c+FccV4br2
	gbNYwWmiDWhLoFA2mSPp6nLbiUBa4jwMios04=
X-Received: by 2002:a05:620a:711a:b0:8cb:62c3:3690 with SMTP id af79cd13be357-8cdb5a4fac5mr1890957285a.13.1773687003742;
        Mon, 16 Mar 2026 11:50:03 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cb:62c3:3690 with SMTP id af79cd13be357-8cdb5a4fac5mr1890952785a.13.1773687003057;
        Mon, 16 Mar 2026 11:50:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm32925111fa.22.2026.03.16.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:50:01 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:49:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <scvvpx72isnlqm4f4eub7syezmhtw5xd3agj34lonhcc5s5zj5@nsbfsbgidnw4>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
 <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
 <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
 <dbfcbc9c-2175-49a3-aee4-434b69cbaece@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbfcbc9c-2175-49a3-aee4-434b69cbaece@oss.qualcomm.com>
X-Proofpoint-GUID: cBvwktqVh4i_jIJLuzg44I9hQR8NndCm
X-Proofpoint-ORIG-GUID: cBvwktqVh4i_jIJLuzg44I9hQR8NndCm
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b850dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=VXU4VRlCQCtIJetfhaMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0OSBTYWx0ZWRfX84ZGUaW4lJat
 mSFeHm/wxaPhDs+BXUFxEzFk/2KGOWYguf6f6ValR97EfL0DwA/iwAItiXD78sTGmQBPmuTfB7B
 XLQ/SqRaoU4u/UOFObGgleCxn9xNmwyuaMKxLCRuDNKTXIP5i/5w7fDiaUOlKSBkCsi+eUn5lxA
 36DakgQVNMWCc5WoKVoI1MgjUZpVNVZCbPM6OHhsxK8YE1gwR83K+I9ihwXN0+/QQPTK2VWmJOk
 g5CadLCawZJdKR2D1guwhHx7cxRnd9DNQ4g/ko/IXzeXeJ76S61qS9uGQRCW/1XeMS15fJJ1h8k
 WMxGLSyU13LbbNlSpIGd5poaSMPUyBEVEO4EeGGaAv0aG8RRz4z+MUivuN+sQ+Z0DL1L/7oGs+/
 m+bwpIyxmJScIFff0B01GYF6zSQR6MEwdVZ334eF61EEnGHBszwtBTfCbVs1zgvEHiR8wo/mX0Q
 fUAmVMC0LpyinO1DxQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_115008_132036_BE4D46BC 
X-CRM114-Status: GOOD (  33.05  )
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

On Mon, Mar 16, 2026 at 10:37:25PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/12/2026 7:48 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 12, 2026 at 05:12:51PM +0530, Vijayanand Jitta wrote:
> >>
> >>
> >> On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
> >>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>>>
> >>>> Change of_map_id() to take a pointer to struct of_phandle_args
> >>>> instead of passing target device node and translated IDs separately.
> >>>> Update all callers accordingly.
> >>>>
> >>>> Subsequent patch will make use of the args_count field in
> >>>> struct of_phandle_args.
> >>>>
> >>>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> >>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/cdx/cdx_msi.c                    |  5 ++-
> >>>>  drivers/iommu/of_iommu.c                 |  2 +-
> >>>>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
> >>>>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
> >>>>  drivers/of/irq.c                         |  8 +++-
> >>>>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
> >>>>  drivers/pci/controller/pcie-apple.c      |  5 ++-
> >>>>  drivers/xen/grant-dma-ops.c              |  4 +-
> >>>>  include/linux/of.h                       | 12 +++---
> >>>>  9 files changed, 76 insertions(+), 50 deletions(-)
> >>>>
> >>>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >>>> index 63b3544ec997..03232b5ffbca 100644
> >>>> --- a/drivers/cdx/cdx_msi.c
> >>>> +++ b/drivers/cdx/cdx_msi.c
> >>>> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>>>  			   struct device *dev,
> >>>>  			   int nvec, msi_alloc_info_t *info)
> >>>>  {
> >>>> +	struct of_phandle_args msi_spec = { .np = NULL };
> >>>
> >>> Why do you need to set it? Parse functions ignore passed args, don't
> >>> they?
> >>>
> >>
> >> The parse function does check arg->np on input — if it is non-NULL,
> >> it is used to match only entries targeting that specific node.
> >>
> >> Also, there is this existing path in drivers/pci/msi/irqdomain.c which
> >> pre-sets the node and passes it as input to of_msi_xlate(), so the node
> >> pointer is not ignored by the parse code:
> > 
> > Is it only being used for MSIs? If so, can we make that explicit in the
> > API by having the 'filter' device_node pointer?
> > 
> 
> Yes, I see this is used only in the MSI path via of_msi_xlate(). 
> 
> By filter do you mean the below changes ? here of_map_id() and of_map_msi_id() would accept the filter
> as a separate parameter so that arg becomes a pure output:
> 
> 
> int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>               const char *cells_name, const char *map_mask_name,
>               const struct device_node *filter_np, struct of_phandle_args *arg);
> 
> int of_map_msi_id(const struct device_node *np, u32 id,
>                   const struct device_node *filter_np, struct of_phandle_args *arg);
> 
> of_msi_xlate() would then pass *msi_np as filter_np down to of_map_msi_id
> and IOMMU callers would pass NULL to of_map_id. 
> 
> Does this look fine ? I can include this in v11.

As this changes the params, you will also need to change the semantics,
removing the of_node_put() from the function and making the caller
release the reference (as it should be).

-- 
With best wishes
Dmitry

