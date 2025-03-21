Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859B6C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uqUXv0r/8O3QLVh8vDMkagGkjjokeiI2xDdN6b6W64=; b=nHrF8HUN6IyxotC01WM0ANIlDn
	+7dEBYtVMAMtj8wBds5wx+rmrUbtcKkn9qzvLmPlwzKai/XFFJl5d3fw6R3dhuvwh4+CzFXEXfgNq
	O4fqUereyEyucVi7eYGY85ppi4EUB7V6PsLrOACisBpemrJXW4WWyiHhWbc9k13fTN0pG/ORKFQs1
	bZfJ85M+D/yTBR6wjk00vwEeSijoKajZH4JC9xy4b1UjptjECYyQhFqIoP/+XdoywXoU6oxrPFFt6
	+HP8Fa1GIJ3b6sjIF7ZWz0U+Go3mMOMlsdRghwdlM//sGvLZ25fMcjHC0iDX4MBrjKhP5pk9a/lm9
	aOiVo1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg3p-0000000Fg85-34Eg;
	Fri, 21 Mar 2025 17:21:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg29-0000000FfkM-195d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 17:19:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATDkt031748
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 17:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8uqUXv0r/8O3QLVh8vDMkagG
	kjjokeiI2xDdN6b6W64=; b=a3QsaeIiEM9t7Qtuc+WZurmqy0+WO9wpbCDREBb4
	FsQAJGFS96YtJgPsMW9+iufBUrK5AtDvSwuIhvUGw/DyPdevDEcFq/wEWRk7vra+
	QgMaxVSfY0mBRNMwAbjKYPtxyhZSAEUbAJ8Fb0ObOzSTzLERuQVGkF+z98WCB50m
	T4pn3/IfV63vVMzeRgUtNpvsYv85TdtmdocNVnsUYCS8WnTYz0hA6mqQ8E9Ih+Lu
	ggZ4OkkUaneyDM5iPE4d/zJNXXpOMrss4EIBeqwqFrVcBOXz7GUuW7NJqIqUsion
	IITHSQ/nTxI0cOG0TbpqPfylJze671pdaHwI77Z56e3A7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kjv6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 17:19:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476870bad3bso36996201cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 10:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577587; x=1743182387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uqUXv0r/8O3QLVh8vDMkagGkjjokeiI2xDdN6b6W64=;
        b=LSdkDwOrceULXcWiYMSyzRPALffAVzp0pOuK/+C6qMa3fEvEbeyCoHZVhiJWhsROci
         afYhx3I8t2F1WYIu/e2J3AyXr51sofMi/gAQhIn/4yxzM5thL/lGOdpgGzmVp9T8ZcCJ
         CAurETxMV9qUOpdc0mwB4E3oIuY68DcHKJQ5abxfy51InTLbWnrMBq+YQX9R35vUVrmw
         YvR0OMQcUhR/DgYQmTUBkXRtTvYt+5108oJiZJ/HUra1Ly5Lxsi8SXyIRLhLkI+Es80D
         Mz9pK+DlangPnI374kdYPW0sR3KVw95IqreISoSScb7qtUNwMTR2p4GqOMaKgl5qDG7l
         7uKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTHSZwNhgKspPOVqghOuaNivt+eE2168J6dBKeCUbuoXBBrVV4UDmSjqHNG2dXqppebba1nWwdTUq05tQAm22i@lists.infradead.org
X-Gm-Message-State: AOJu0YwuBmhx86mS+uLaqPj+MJP21pBwn+JAe87bjPu2+bcH4O5/q+5M
	Rp2n6d6maKwXEqanLVlQHmHAujm3ZXwcgX96+OGsNM+NU0hp8OFWnfwtkTdtMsTdblAlrpTjrWf
	CHIDX4Q/IKopUAo/S3+uYIEHtOFhXLWnnJLRLnfmjQ47rYxWZUIBq3wrmM3TnN20QktPPTVo4Gw
	==
X-Gm-Gg: ASbGnctJnUXJ9aLBws6Pyhto9SYxXuByS41yaBG20M86qxH9Y+yU84SC+V5nX4xQ9KT
	fA/dVQOWtllZzGZcHEk7wt/9sXlHPMKTNpGkwgn0SDhD0msezUaQEINBoCXFFo7NskhryaYIeVd
	onT41qUrgx40XYnipm6620UYwnabPvRAIzjVX/QQmpffe+wA3yTQ/uSRAuytPzHTbcEa1vh8DTf
	FYzQwS6Y1Yx5mNDH4scyInhYVuvw3oL+xYWFS5j371ZAlSkWY/1dJuKMi5DC/yQ/l5hpGXexSnZ
	4UF1o5G7Objfp7Rm76ufmRkXF/SOLxWzZCdejK6Vf6MREnaudk/s5i7hkygb2QV4N2jJIRz6fuA
	1om0=
X-Received: by 2002:a05:622a:989:b0:474:eff7:a478 with SMTP id d75a77b69052e-4771de6458fmr49666181cf.46.1742577587095;
        Fri, 21 Mar 2025 10:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER60Phq8nLZh+XeCU4Jt2MqK+yrUa3O0K5NTXyK+Z44YiEZ4OyV6O67mgxGbNT2KMwFFn7dw==
X-Received: by 2002:a05:622a:989:b0:474:eff7:a478 with SMTP id d75a77b69052e-4771de6458fmr49665781cf.46.1742577586679;
        Fri, 21 Mar 2025 10:19:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad646893dsm226011e87.44.2025.03.21.10.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:19:44 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:19:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
Message-ID: <hgvfxxjvquh3tn543ae44o3lie3pwld5snbewy2lxcrtgd4raa@eyfm57omt3ge>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-3-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320055502.274849-3-quic_wenbyao@quicinc.com>
X-Proofpoint-GUID: RUpVepNHL0UkgQfRuET0yLHTvqYTXx0x
X-Proofpoint-ORIG-GUID: RUpVepNHL0UkgQfRuET0yLHTvqYTXx0x
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dd9fb4 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ICgkrN6sfqZrQ0pjF_MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_101949_326707_C6C7F6E5 
X-CRM114-Status: GOOD (  19.20  )
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

On Thu, Mar 20, 2025 at 01:55:01PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..32e8d400a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,16 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +			pcie3port: pcie@0 {

Empty line between nodes, please.

> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>  		};
>  
>  		pcie3_phy: phy@1be0000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

