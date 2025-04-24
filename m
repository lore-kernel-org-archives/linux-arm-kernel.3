Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F26C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgOyK6Aj8y9bqEdW8CqXJdRwZh5pW+vbS8PbU9FROaw=; b=COuydvi9r1HoV83x+crvBNa0yi
	DW5Ij/5kR/thXDGc4s4/iGBYIl72aQGCZY/xlk5jdztTzn2B6/OY3ZX3PjXf1kOlBxwzvmyASgQhU
	g5f0X0SZ/+1Oy+ipyqDsDy7qFOPpUYRDLDdMfDsGiaGd7l0JEJB/kS0J+npMMmBw5ZTtuOrSTPEYH
	84Ir0OUMt2My6p1P0nuL3lLdumLuFkKQs2WRVb51sVp5wu0Quu47GKTqo9X8QjRErzuNLDMNJ0I7S
	HUuwgFL5i/F8+j0NUKlwYuiyAmGkxOKgmNn+dENdWd592k3Eyt6Bephd4J702nvVLWIulDyvTUPUj
	ghJN7wLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7utM-0000000Dspk-1kch;
	Thu, 24 Apr 2025 11:37:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t1i-0000000DX2y-3fqT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DgOyK6Aj8y9bqEdW8CqXJdRwZh5pW+vbS8PbU9FROaw=; b=n1u+VQT6MzXyWNuhpI5ud/t7yW
	l5sstD/6IQgwQN7YYMxYeSkB4xjLqZ6LCTYD/WpsqAG8TSyYA8wp96WX3/kCRf1q4539xHZI5eulB
	Dyfc98XaQZWz6PQhi3+FICqeOBSDMBb/9EU3cjCYfXYFNqruSrMaiY4j5SWreKvkEFBWQxgiGQC+s
	D2GwdDOq2+CuQcwOrK5SyqUTbamRqfz7nXFiGYVw0iqoqmadxZWuzCQ2j30etW3Gcfx/D7KAFd5LI
	GM5ZfI6afTpo+21lGJnt32IEXC9RZe91cOooo4W/U0aTtPXmBjO6yJEKaWKrFp171FsbQxCoF1HDF
	vIHXfNkQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t1g-0000000Bggo-0ZS7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:37:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F83d003456
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DgOyK6Aj8y9bqEdW8CqXJdRw
	Zh5pW+vbS8PbU9FROaw=; b=hp8m0nAXnk4d4G02FKP6jguqp+UJUzC/82qow50d
	0L7MigqO8ITXrjG01Ox7yDCBSQMzPp6l8v3ZvSHeEqTiTX0L0jBwionjBfVRlCqZ
	sUwSw8jI5DLKU5IkJI/q4VZXIKW7BaVSbVObrfeAS8ZdP6oUnaM9W02ZgE2NA5pl
	GqOXFCdp1mmQ9J/Oziptyfj041KAOufp1hFq6dY8nshF5y/x4/efekkiqUbGLv7z
	BNVnAYRw4+WgrXvhPsJ2pmkkEdS6g+WlgyIzOuYO9oKFtI2AuThDuFWms17ecRwx
	1BnG3atS1yT9goBfnBj/5LnBzmk9UTOpkSk0bg8hiIRZDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0n027-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:37:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae87b5182so14588701cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487463; x=1746092263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgOyK6Aj8y9bqEdW8CqXJdRwZh5pW+vbS8PbU9FROaw=;
        b=uGEWN3lv2nxeWVQvWHJF21Bzcg5DzyGOBt2xHaqZ6almiLzHJeUHRBJrVYxNzQMGkC
         9yC0XIC/KtEGLQ6wbx9iZFgSt4pGhAp0CsI49x3GgkkcPVNMWMbNi3jktBELHzv7rrwj
         vHXdBugqkiBbzjEId7rzVZxjOMD5OQ8XJKopba/X2Wag79dQobXycr8YuEZxD6N+fjNm
         wLwTkY5n0eUIvTmO/Z19JPGXtIIbYK6Fv4GOPOllz461SSqyiIli8hyA76zvPwkz50iv
         00RFlGYjSAIWi4wDnII8LtZYfT/6gN/rFkOQGadutOew4ZJJKnGIPOsS2ZWeF8gAuMH1
         xhuw==
X-Forwarded-Encrypted: i=1; AJvYcCWsy2uO66/ssqwRphsrGs3Vm97v3wU51jVNoZC1oJWUsfu08LYM3g7Zy0u5BaA1VSJ6S45ELGQBAv1jilONhzUj@lists.infradead.org
X-Gm-Message-State: AOJu0YygCSu1rfIMud6oaPrjtVboKJecgMn8c7QgVa2bbf+Yfle7J4a+
	4Se7LANYXf+kNCXCs4D+W1iiCea/XiRmsxzX4ffadD7vvzxxjQCXBEvd2LSPgChPF37EO+wovOs
	piVj1TG4+Sq4rVMXoL8qt/gADEOzrL7gq6egfCa+EgOEgNyb1kUIAhf38yGCRTwQQEgHqB/nDsw
	==
X-Gm-Gg: ASbGncvp1mv2W3bj+/LsmbVWT/r+wX1sjvZ43AsaETZq/iGL0lY2GaSkStdCQV28Ft0
	HBbsCQhY1I0Wp0aaArjx62FcaA5N77gs+QF5LFqZolxhVL17vuWi+NvUrPgTVm4Xb3RHh544yIR
	hRAYhGRtucc4jLTZD7uyugCmlT7Yfbfeh6rp5ACAn4xCNUUcDT79k3/LEPTXRy8aPc022BCFwcW
	rDRZSYAJsMIGZyk7dkAu7RXt0527CfL+KEjTJVE91YQqy9D0F6VRQ6FbpFypLt/PNBuaenwNgNJ
	1VQ9DB1clOehsXISGqK94yKngx6yrlyl0uvp7AKGr/8IEKe7EbTVIoqEQR2Lf6kJ3L5HviVP24I
	=
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466751cf.30.1745487463407;
        Thu, 24 Apr 2025 02:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1eEvXAeDIBJ+oaIV6NuXCx1ty2W8MF/z7TiaW3cFjO6fXs6cgqkeV3Jv4TZtIDAyz/pl37w==
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466451cf.30.1745487462999;
        Thu, 24 Apr 2025 02:37:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9ea4asm166075e87.149.2025.04.24.02.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:37:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:37:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <ayfgkx7ep3pglzydno3waipm4xqcbuj4v4go7tvm5j3hu7mswr@ceqbynkuidcb>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2j3RrL5pTy4Al4xQYIsz-isnvYBl7H6j
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a0668 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9yGODh8E-QI5J-fucZYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2j3RrL5pTy4Al4xQYIsz-isnvYBl7H6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX6mkord8fj/G/ x2BfpfOh4FgI/07jqg64aZFkErwpXW3yFuni4U9K8kCYbeia7nuWCBnLcZcPG2rsGKOiRxP5oof F3zsLRRLmWrrzvayjLF2r29au7qdu4s+Al8KFILT3iU4sKVvNsftBYbtDaxyAMdJtZV4XRYcMGL
 Y34Q8icpZopVW4aSDNGrvgaFhU/QulaZ55io0vXBqP9V7pk4Qu+Xey/Vhk9D/6FEOX9UZ6IFnZW PXZ1KelkB1DfgasWUWe5lQMAr3F9MhTxLXGvC8V2ZngCEzzp/46mCjv4brsH74Duj40lisLaHhk 0FPH04owhlDDMa5nBzgSWMbWekGYUMsVr4xEgTJFru6GlkA1Taqb/6c2R8tZI4A6FDzXOTupuXn
 xzs3D+IUTZlgcUVkQlw44SbRLQ0Nj8mGA3G359yTWNyanNrj1ZOh8pXscmDDcIgbPLamecFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=908 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103748_451755_00F9D43F 
X-CRM114-Status: GOOD (  15.69  )
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

On Mon, Apr 21, 2025 at 03:00:11PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.

What is updated? I see only additions.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

-- 
With best wishes
Dmitry

