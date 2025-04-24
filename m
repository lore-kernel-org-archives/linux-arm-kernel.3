Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F81C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ki0WMJZKSmFmQy9e7rjeB45XgrpCTsnp8UNMzxotgak=; b=Y0vZO7WbpuaTCol/93iwgzwxjM
	Mok2boLgRpPGioIzLH/hfvy+t03MLnypAdCi6f+fTMS8ncG8DuKIhfV7K9B5TL6nr5fDaadiqNUOk
	3wbe6nVXu+/Pnc/L6Dbzge/JvwQbUOw5+tjIGZwKXh0hnJk/+ZDJivTP3PFiuWoiRlkvERl/Y1R8l
	EbPJ+hCl9sbSXzXhDqdYqeekCLmd89KOMXFIP14zgenZNT7WvqwamWZnrdU/5hHb8eSekcTQ8RGu6
	K23qc0GFSkkDRaL7qj43o0p/vX5zJWhQzhxb0SIotPBPhYT/BFK2AiYifG2Cc2JSTkWUS5REQh4Yj
	fjoih0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tpL-0000000DgO5-3OIr;
	Thu, 24 Apr 2025 10:29:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t07-0000000DWTm-3geo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:36:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F54m016951
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ki0WMJZKSmFmQy9e7rjeB45X
	grpCTsnp8UNMzxotgak=; b=ZoW2u4ciuCgGFbFUggKAC4FR9QHdfrqdT7adpV0H
	oQ3a7gUMOG5EvWREIOcQ+B/1LpXMwIw97yuw6lqFdE2BQPs6z+fagMsRGn1T7jjB
	6nAccwXImbAz/kgD1xdqjAlkzM++ojkAyY1el+WIt13tL0d50x4nSuxsj97/8CLV
	i3deGLaAnaHo8m0HCrvG2cjqgz12urviY+Kp1t9Te1P4CR0r7zcDefn/+QoMbEXR
	DpQQmkvBXnQXuWq1DI3LLVQHW35DFtBhHrWEXMgJks7nSO3vVuXrqOqtBaPzOYzq
	bJZ6u3+vqjOsoLJTK3zt8TS4zF6oBcsqRVhtQMF3ODcmAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh14ysh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:36:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e7922a1so162694985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487370; x=1746092170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki0WMJZKSmFmQy9e7rjeB45XgrpCTsnp8UNMzxotgak=;
        b=ehuDXGMCnNlL9JlSqJtv9iAq0N4aUWBFiqlaTQRRmkQEXIt4TcB4Xywv0VJpx2OkiG
         7ko2GjdhBzm+PVHPRnQtNnjdInXnJ8qSTwrlpkDQgoMRkU+ODvBEDixI7I4LSe2cfLEQ
         NwB0Z9PGqPfM1fcTZ0y12V05N3Z0UrEQOLezIsSZlOWmdfaqHaozasd6K4gPbsq1aKuW
         Y9tF8mUQF7nwahGn9XguL82RQTN7Z4jcrLbr4NIXXH5tJ7BCoj6OPGO0xbRxVSA6IcM+
         KEqL2BPuFv6BOcJICSYo37UOSERPpr6Mi3Fe+diYYRkhvSe5oMIpuYqAsrFJmofHoR2Q
         aOeA==
X-Forwarded-Encrypted: i=1; AJvYcCXESMCquS5/37060J1HqnmmJPBGJfQ142YcpAFXzfe/LaizDvWK+WnSVmFxzfch7ATEP9j/twQFM4yXWxGDg5rS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5gO3WD1Cg4Nc6vDMDL324AN2SyGIi+E8mgKoiSXn2FRSBJnzC
	Qsdm2Ouw8Hl3WdjzKt64a68A2LaWnl0n9TZO0JNbl9wGt2oG4+xtFb0945SfjRDceCP6Xqs9Lso
	M6A6BDUd0b8N36wD1Mc9IUOSIZX1l7aWwlbg4e98mdRBReXeKp1YTNUXIQrz55djfPWC6ErOnWQ
	==
X-Gm-Gg: ASbGncuqMv5u5GVtgC/0qp9dlHkHtthbc5a5jok18K6mIyrmRY2knrdLegNpoq2760w
	27TjpNhHO+u8BzRnWlIDFyCaOi6Kr4xNb6U3FM7q36VQNOATbVHBxskNETK6bl3bQJ/01rpkkQN
	nVSaeAAQXEUSKy4QMTybXlZCbPD18leuv+sodgmEdytWxOMmhYh8SdNjAe/ntIfp8ySMQHh1eul
	j2oUDnjAyNDLw9cyVUQrYCfUnI+0p12L238Poa7BDX73CG6UBPVzfzX9O+1nXYJAn7p8gxbR9nB
	UojIlzHQcJBPy7KLAvRqHaCGPNoq4Q8ZLcvHqCmNJcbDPoutA5NmbnM2CHWnYESd9Htwjj/RdL0
	=
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286192585a.11.1745487370266;
        Thu, 24 Apr 2025 02:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ3XpknWBRjJVyY9U395kjM4TMXYtQ89RY/LCEXTfiRyw5qhDQDDxCNr+1yx1C+oNIUZPNCw==
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286188885a.11.1745487369953;
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8387sm164282e87.244.2025.04.24.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:36:07 +0300
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
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 00/10] phy: qcom: Introduce USB support for SM8750
Message-ID: <kpub5pyyqb36aajcu2qchcjq7ypqvx4zywxusuvvlq7e7hr32k@ytbygrzwlfqs>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-GUID: 9EiueKglEGB-IkGnYiilihtdwyJZIuMT
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a060a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=spWr5J_MtH7HAiET_ysA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9EiueKglEGB-IkGnYiilihtdwyJZIuMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX6m4kr8cSz16m ts4G+2iuhjCSyY7ZkW4cayP5x22Pg9ukq/KjqY2CFw/hun+mRwBkzLqM4Rj4/AbVexLDYv+Y4c8 XDiQjgGpISUUOeBaDLe7ESNSfv7D2dNQNPB3yrIUJCImlmbsCA8eiN75pbj7tMp15f282B7QTg2
 e+QHH1SAiqsuHwhqm9w3k8u6uLd+DaF3rHjAa6lCrVn/7LSyc8sx896h9w7SuyOuGzhQvOtROun /MbyzA8qy6ZXSmhu6w1X4Ezf6n888f1JhjJoF/Q0J5dyEabfAiFLbq3acdea4HwEls9a5aYH/R9 IIl76Kopg1CYdOb9DxpV+usTy4PXoD62kTRJX3g4eJdnq1memLOgpmRu5UZIqe9kw9OBLZqH7SN
 Oa0ah05dQLb9sf1aJxHR11onq08LG2y2qIwvEHE9USc+GMzIu3fhr3EjdqPMUrPCYBshh6kU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=644 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_023612_040489_39037CEF 
X-CRM114-Status: GOOD (  18.71  )
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

On Mon, Apr 21, 2025 at 03:00:07PM -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> ---
> Changes in v5:
> - Removed refclk_src from the QMP PHY driver as that is no longer used.
> - The decision to move the TCSR clkref property from controller --> phy
> node was made in v4, and the refclk_src was a lingering change that was
> meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
> clk will be voted for as well.
> - Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
> to take into account the change in clock list.
> - Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com
> 
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver

Which fixups?

> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 

-- 
With best wishes
Dmitry

