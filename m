Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D16BEFCE53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 23:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=; b=DuJ5fZa/CNsoR6i5M78ynfNkqw
	6LgljIkzUQUsIQZcjCulPhJiJUgAj+b6JCJgMj9X2yVU33ItnTZ1YO/46J5gA3DAjl2WLuE0iml09
	grLgaqqhS4RvqbiuzA5Iv1EN0Zc0Tq3BD9+eqa2DZUghJbBAyv6pu7NEvotmBH2+6kQosvNK38wQI
	hUMFlH74/frmXuCO8fC+22MmBHpZaycCwog6A2LRkT7FhozsiIZfBELlMFLkoeHXNjRQcMc2+XD0t
	IFQUmwFQ6lkhbHvm3eTMJeg0Nfr0JzgsQs8vQ/ITqmGXyNQMpY5+f4arYu+NU/4Blcftfea66R9un
	BzFSjTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvwr-00000000dzm-0VaJ;
	Wed, 04 Mar 2026 23:48:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvwo-00000000dzN-3G8p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 23:48:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHEih3837984
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 23:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=; b=aVdHPngsjbyqgrIW
	m0MJv9aGvPSOv7JHKGUvwROWy47iUsBdiQmtf8e0Vc2Bz3qNf7NAxjbYrjpXQhaX
	EKCyjBQQVy3MK7f/jU4u0nknS/GaC6/sGyDa+XlKtdvBgiyRJ0lbzrrfNrkVMuBh
	f3euURbkqHuLnHx12azkHWv8cwQiOUvW0nubrOJYqPhT8oL5TQ+VQUCQ34e+5xE5
	9M3r3YAGA6/v6aUxLAxzIZ37vMVDkG7+r5SY5xMSNg+q9Wppsol1jYxs64OOMeaL
	dhQKmoQFsQ/I5gNQKL8MQ2Os574Lbh57rptn8P8Aj4ezUttSie6dKLNuheXOOduW
	hmaQuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m122g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:48:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso4705385585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 15:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668089; x=1773272889; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=;
        b=Fe4GvT1m4lrxHBwdVmIklEOVsMXi9tf9Lzn5ZzVI7rsETeZbYVhDTT5ruc5iBjntiy
         P6Mb4OK/R3IOEIh+SsQIcABd5WqRm/yGiK88YToqg45Yl5tiSbL/3XTW23Mn8WwfsB4/
         dTaAqL2EsuKo0KyzoL826wD63Bnlfq7fQPD9Zkri/dUkuaSXAAQZp6jbRe7ANlawYK9F
         o9m+SVEwPo8vhPHx87QuW+siPspgJmirtW04mQlwuY0BzYPHP8yjcf64HdrqnlzxvoHR
         h4czP/WBfMS6WzYqRo4nlLH9LPZbGzPMQ4o6uEnOXCwnb3WToz01Flyx/0C05AWTsjEu
         kOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668089; x=1773272889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=;
        b=Cs4Adput0z6dC6UG0pNcCBYQYnRZXSRgK8tv8rvLCQ6x8NYrIvtIx+75x2FcV+YmfB
         CuKUKrpyiQ0vRfSpZOEZyKquSEquI6JatTdiJAshVl05L+nMnRvLF+rAk5g/Ov/VNjDR
         PWT8z/dtff8Ok7uZyeBJ5mB+B+KeiGzT+z5jhiZ29zb21nweKL2q9/xVXpwa5hCPnaP2
         5EOtw+hWFz2xLQt1CdD6/9V20FD9pxTp/S3+iq8UFrbGhArYWW/zAw//TZJmr1D2svm3
         Q7at+NocPhGEU/3P6r8YHs4U73Dk77pbhiGtRO2tHXPfnl7tNizlhyZlzLdQZjn9X9P6
         coow==
X-Forwarded-Encrypted: i=1; AJvYcCXKxahNyvdZUVaR5Y9QkPNwvukjFcj3tEVXZLgzFHa6jI/v4GfhamC1p86m+VNcntsuj3Uc05lc10oN9e3y8CoU@lists.infradead.org
X-Gm-Message-State: AOJu0YwyvL03sCo6RQIGegy3NwhxqrPbD0+3aOXUK2unBlAuoEYjbb48
	uHr3rGzH2JmTXVBnhhB/IlduzQrfyNYX6MWPIJDHf8ijX4DzmwXnoBnXcJcp3uXwnaomFZ+PiQk
	W1nUC37XC7mky8Vf2nvYmEV31cQzqPV6lcQVdkITvLm0Hm+eULDq33ldQP8RdfixOueato3D2Sx
	yNNg==
X-Gm-Gg: ATEYQzx5kPD3VBUss1WkHODjchFxU3bPjGN3UusPCxXFhzxbIgPcHJdVA1ygF8hQR3z
	oUvetxxBhCUhUqpy4H2NQDARUmghLLsJxnw3sHhCGWncgV1RV71bhx5b4IrcpfbjOnI2ojeQVOm
	cYRMVTV+2zCkuuObLIKr9KhZMjp0lulpO9AZJ0y02U725AaM7atP1IefG3IewmUysAFqcAhfcCe
	NS+LxA/UseYWkrZ7FAgpNUAIIdP/5mHWbchUQqZF5hjTgdVynTsXGDqIOzrHsf0Qot/QiX5nUhS
	z+EuKT+9pFDSaZS9xFebo6h9rrww2527O65+mIrIRTIbhmGSxR/6fzLjrwplXxuHtXBfJGGY3by
	uREc7QUrRIAx1yjehX9YyurtO4dPjN/ptoHf3n6MKlH7Z5n8EdfK/yRoXsaXVMHQRRgRpz4iHMP
	LbKhoxq4Mtk50y2rqv5s8e9SewlzLO/9BMtfU=
X-Received: by 2002:a05:620a:460b:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cd5aedbea3mr527937385a.5.1772668088876;
        Wed, 04 Mar 2026 15:48:08 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cd5aedbea3mr527933085a.5.1772668088325;
        Wed, 04 Mar 2026 15:48:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357fa9dsm1597108e87.33.2026.03.04.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:48:07 -0800 (PST)
Date: Thu, 5 Mar 2026 01:48:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
Message-ID: <iuy4mdv4hr7qdem2zm3yg5eostdhlcta6tifqasyov3ag26yje@huragoeossqf>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
 <86342janlx.wl-maz@kernel.org>
 <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a8c4ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=srtYxZOELw0pIWJIyL0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: XnpC6KlcJDa0GtXZ5Em1TERtyjWSpFkh
X-Proofpoint-GUID: XnpC6KlcJDa0GtXZ5Em1TERtyjWSpFkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfX+IDhk+UlwtuN
 k49wdUzXDGUtQaNeV9iSoZNOVE7QGo5Y7Rndxy4ihvXDeavzdoKOuu2hgIvb+DB9qjb4I0BH/XZ
 iis2r6cuxTqZbqnKogelEgReyAGMlSFw9pr3EFkjJGd4ziOKcOMWMXZcweFHabBfZfqJhk3F4qg
 2A/BjfNGkRiHjGdxON1S53wYSJ3cw3e+iCzjGpOCurrlr5ygyFB5Jz1LmSS+2zb9vg5pTcdJ1Pk
 ANolZ+aB8UlBrtZPk+3DjQNJzRlK9z3heBm0Au3RS1DcUliLOyDlHM4gJcN1zSTwvzI71tGMeBy
 SNmHIo4qau6Mw2We1cpxnYDVOKyZaCNHWCI7tNKUGLrhiGKSBOT6ouq/2NjMxsUtlYf2oCeFdhl
 jFcVv9QO+TYC1oIvoatXd0g+LA1fdCccZWvj6L3rJ5Zhxx7zZzcm3TcJUA1qUfmkh6SglUJlJAA
 dPTVcGxfq1j/ytZEg1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_154810_826203_BC4E2896 
X-CRM114-Status: GOOD (  27.77  )
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

On Wed, Mar 04, 2026 at 03:02:14PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/1/2026 3:16 PM, Marc Zyngier wrote:
> > On Sun, 01 Mar 2026 08:34:19 +0000,
> > Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> >>
> >> From: Robin Murphy <robin.murphy@arm.com>
> >>
> >> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> >> properties, give them some wrappers to conveniently encapsulate the
> >> appropriate sets of property names. This will also make it easier to
> >> then change of_map_id() to correctly account for specifier cells.
> >>
> >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >> ---
> >>  drivers/cdx/cdx_msi.c                    |  3 +--
> >>  drivers/iommu/of_iommu.c                 |  4 +---
> >>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
> >>  drivers/of/irq.c                         |  3 +--
> >>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
> >>  drivers/pci/controller/pcie-apple.c      |  3 +--
> >>  drivers/xen/grant-dma-ops.c              |  3 +--
> >>  include/linux/of.h                       | 14 ++++++++++++++
> >>  8 files changed, 22 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >> index 91b95422b263..63b3544ec997 100644
> >> --- a/drivers/cdx/cdx_msi.c
> >> +++ b/drivers/cdx/cdx_msi.c
> >> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>  	int ret;
> >>  
> >>  	/* Retrieve device ID from requestor ID using parent device */
> >> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
> >> -			NULL, &dev_id);
> >> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
> >>  	if (ret) {
> >>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
> >>  		return ret;
> >> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> >> index 6b989a62def2..a511ecf21fcd 100644
> >> --- a/drivers/iommu/of_iommu.c
> >> +++ b/drivers/iommu/of_iommu.c
> >> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> >>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >>  	int err;
> >>  
> >> -	err = of_map_id(master_np, *id, "iommu-map",
> >> -			 "iommu-map-mask", &iommu_spec.np,
> >> -			 iommu_spec.args);
> >> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> >>  	if (err)
> >>  		return err;
> >>  
> >> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> >> index d36b278ae66c..b63343a227a9 100644
> >> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> >> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> >> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
> >>  
> >>  	struct device_node *msi_ctrl __free(device_node) = NULL;
> >>  
> >> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
> >> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
> >>  }
> >>  
> >>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
> >> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> >> index 6367c67732d2..e37c1b3f8736 100644
> >> --- a/drivers/of/irq.c
> >> +++ b/drivers/of/irq.c
> >> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
> >>  	 * "msi-map" or an "msi-parent" property.
> >>  	 */
> >>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
> >> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
> >> -				"msi-map-mask", msi_np, &id_out))
> >> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
> >>  			break;
> >>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
> >>  			break;
> >> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> >> index a5b8d0b71677..bff8289f804a 100644
> >> --- a/drivers/pci/controller/dwc/pci-imx6.c
> >> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> >> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >>  	u32 sid = 0;
> >>  
> >>  	target = NULL;
> >> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
> >> -			  &target, &sid_i);
> >> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> >>  	if (target) {
> >>  		of_node_put(target);
> >>  	} else {
> >> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >>  	}
> >>  
> >>  	target = NULL;
> >> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
> >> -			  &target, &sid_m);
> >> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
> >>  
> >>  	/*
> >>  	 *   err_m      target
> >> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> >> index 2d92fc79f6dd..a0937b7b3c4d 100644
> >> --- a/drivers/pci/controller/pcie-apple.c
> >> +++ b/drivers/pci/controller/pcie-apple.c
> >> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
> >>  		pci_name(pdev->bus->self), port->idx);
> >>  
> >> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
> >> -			"iommu-map-mask", NULL, &sid);
> >> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> >>  	if (err)
> >>  		return err;
> >>  
> >> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> >> index c2603e700178..1b7696b2d762 100644
> >> --- a/drivers/xen/grant-dma-ops.c
> >> +++ b/drivers/xen/grant-dma-ops.c
> >> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
> >>  		struct pci_dev *pdev = to_pci_dev(dev);
> >>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> >>  
> >> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> >> -				iommu_spec.args)) {
> >> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
> >>  			dev_dbg(dev, "Cannot translate ID\n");
> >>  			return -ESRCH;
> >>  		}
> >> diff --git a/include/linux/of.h b/include/linux/of.h
> >> index be6ec4916adf..824649867810 100644
> >> --- a/include/linux/of.h
> >> +++ b/include/linux/of.h
> >> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
> >>  	return of_property_read_u32(np, propname, (u32*) out_value);
> >>  }
> >>  
> >> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> >> +				  struct device_node **target, u32 *id_out)
> >> +{
> >> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> >> +			 target, id_out);
> >> +}
> >> +
> >> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
> >> +				struct device_node **target, u32 *id_out)
> >> +{
> >> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
> >> +			 target, id_out);
> >> +}
> >> +
> > 
> > Any particular reason why this is made inline instead of out of line
> > in of/base.c? Also, some documentation would be helpful for the
> > aspiring hackers dipping into this.
> > 
> > Other than that,
> > 
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > 
> > 	M.
> > 
> 
> Thanks Marc.
> 
> I made them static inline mainly because they’re just trivial wrappers
> around of_map_id(), so keeping them in include/linux/of.h avoids adding
> new global symbols/exports and keeps the callsites simple (similar to
> the existing of_property_read_*() inline wrappers).
> 
> That said, I don’t have a strong preference—if you’d rather have
> out-of-line helpers in drivers/of/base.c, I’m happy to respin accordingly.
> 
> Re Documentation, Sure I'll add comments for of_map_iommu_id() and
> of_map_msi_id() in follow up patch.

... in the next iteration, please.

> 
> Thanks,
> Vijay
> 
> 
> 

-- 
With best wishes
Dmitry

