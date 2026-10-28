Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27520606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Myqx6DLZ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgvPAAv2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C8el8aPf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=; b=Myqx6DLZcnzyIDhi8g3vYthhvk
	Q2UwHUcsM9k2RDUxZHkI9LpulB/JIgyUB0Ck/6/ClxiBJuVkwqOjpNcwJhd5MU9bp/K4q49n2ryth
	g80KWeCxCVRB3raDoiQMWwP8YDXJPL5AOW8KDmgwRVwlN5SIxpf3sdqQmd0Dh9JRY/LtAKNJbbG4g
	Ehf/dJS7eDd1qv+bGFEUG9pdFafARaZNol8S/eAN3dYNGO6PFiPUMOlU+8FFVjtQzuuc39IXdaOx8
	S+ZhtDXOcnM6mpwY+lRucyXvcocfI3Re72u8itLyDMMgLFnBD9X7+xyn+7+CAkuJxR8VY7DuLJpXJ
	FcRJagBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5mZ-00000007QdC-3svP;
	Wed, 28 Oct 2026 15:41:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5mW-00000007QcF-1SsD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:41:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAbX01459100
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xAGpz9TD6oCxgoJfz5D+tXda
	BBTRPGgALN6kzjVk6w0=; b=OgvPAAv26Z+jY/F3lMnjG4J8bK2QeZ+lW6MBAcFa
	9ldLQr72iZ3IOG8JMXXK68mRP8AW3N2Ndvco1y8nUQeHp0Euxm9Buo5Qa6YXkUS9
	2Eu/O85eHzBqAzgzFL/na3MgIz2nFnim45LBQRvbu5Nvd2s6hN3O8YMsf9EftPke
	9AkgK9OwzOnzJX+qCuvxGgvRD5GvSCSWD4TqEx5nV/JZiKYrW8KBBTVUimZOljsg
	GVdeOAT6CchVYA2Uq7HtfUnhRgFmNdmZMoyodDJ8ji09AcISYE//UdD54a5Fqf1X
	DeFeURvl86BxECwPBb5mfs0bfHMSycRCYZuXDCbmPyZQ/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttvnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:41:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7c7e8becso1086156d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202098; x=1793806898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=;
        b=C8el8aPfJ1ZRxDIpgaNn/3fkRZ0to1WUih0/sJ4KVdzX9R5EAaWaMVJzXvA7QT8cxM
         V12tt/QvasQuPfHtQBEYo7Y2tHNVAJiUBRyglJoBcGgNm1wRGq9XQDwsY3gyYQotnvX2
         orA7u5KhP77KB5CS5NWowh1u6BtpF7Iid0CJHoSLdK/2xQv49rbEMcjeTBDAGS+/hWbu
         wCJvCUzh6I4Sy+kasGnpNcrFzFblr4eLWgYMYT1bLTCBMgSbUkbHtMVptgo3W1Kb1sFj
         5EwA2suSO7Pq2XBxJ7gk7q8cLqAbQQAnQlbfmMejRUUw2m3e6aY/2paqbxpZoDgTz4Zh
         DjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202098; x=1793806898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=;
        b=vPGo+LK7ZBaGklDsgo7yXmNaR2o6NWjbl5WUSDVT9TFhJZVgYviqXCHRf6SPJjRe6k
         vNEL7zEPIFo74VXcRjm2p1b3nKmuc1MV1wb8w4zQ+ORfLv0kJMHucH6sUruL/2qJm1u+
         4WPw7zFgOtQvO/H8FRCBGLL4q/sNvK1yn2ug8RjSPR7egbZpUOZiBLbGMYXdsDOhI91a
         wpAF0NuAbljb135wro7iSn5kfkOi+lycLJqLE4pjm4ociGBNtlkTKO+j0bga1vfK8jrw
         1GHRIO6kAyTbrFzAucR0CjemLiE2volglpc9VxLZrOfIfGTn/5QK0k6yhxhvFv7T2xU6
         rx/A==
X-Forwarded-Encrypted: i=1; AKwUvBypslAaj0H6uJhJnoBKlw9eBY083ZprdCAMKz7WcImEdUtijpWHFLLSDQyDWTohS4KmPe3uZQeegJ/rNANR/N67@lists.infradead.org
X-Gm-Message-State: AFq9FYLju+OGS1wPNvF8Ixi2BAPKYPV1qRu3aihwP0k752LfR5HM+37h
	5/41XTB8Ki6d6wU2LTOQC/OxRzJXIlruHqhBtlY/ZOgvH96TO8cxDLlHHBbGy75CpML6fQWOZHG
	FSjVlQS8edQVXEvx4479TCN23qOImM4q5Eofu6a9iHkQffLYNTueLIuy3tXSwNMk1fnrdYuQ2Oh
	4q5Q==
X-Gm-Gg: AYBFou1HAaPhWWX9tvh/SWApf9T2f97NaefCbhTLSwq2XDxQ0qzqesUoC36XISiOBAo
	Ao1ZVkXrP0B5BLI3Y6mReNNXg1OSySOS2ixLspd7aatfTYqTxD3TfsWvfPfkiobMh3LldQLXI2Z
	A51c0YrFFhILaGoFSPhB7IRRFkiwVBur9GkWq+Ph6swc94R1O0w7fYsQHfNNrfxqQ/af+572sO7
	Wq5gn3ENxC6HJgZfX2qGphYdeY66r3WIZLEcL+0h5ePO0I4m/TVvlI2Fz3H32JKdPIHIF+0GSeE
	OG+CVgdA8S8iTUFR5Gu3LO3o66h83YP0Mh1WrtOhNn4f0MTn44HxX+RCCmiODXd9bRhFG2I18IG
	OVbuC8Sd0uloMFbJ1MbCwO1A74b4LlfKqKd4w4HrIyuCCXtJqnWt2LunNAw74xcERwg==
X-Received: by 2002:a05:620a:2b4e:b0:93e:53fd:413b with SMTP id af79cd13be357-94408dc203emr391842285a.59.1793202097771;
        Wed, 28 Oct 2026 08:41:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:53fd:413b with SMTP id af79cd13be357-94408dc203emr391838285a.59.1793202097156;
        Wed, 28 Oct 2026 08:41:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm34722381f8f.44.2026.10.28.08.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:41:36 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:41:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spmi: mtk-pmif: retain controllers for removal
Message-ID: <e433xawx2fa3x33rslqiijtbk4vf4ius4h4w3k6jgrwhsqtpww@zyyd6mxxvvni>
References: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Proofpoint-GUID: zmuTVr_l4ruHLF1bdyI2H2Ekfuqs0b2P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXyXUS7AVpq77V
 EQGlisLfHZks0+Y60XRZ95abHeNDH1VAA9dXyJb25hh+5ggeORzgmbt+Xruv3MCRbQ8T9j5pv6s
 ch1mpRA8kkef1xsdS1eCo/f/3qLHgtI=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae217b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vSNd-Fa7lg0QEwYS95cA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: zmuTVr_l4ruHLF1bdyI2H2Ekfuqs0b2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX9EJ+PCPrGDmT
 YffZBK1xTgdr5wlFmfts1l8w1ZSr4RkQqNy+riw0vZTBzI3udoM6U1mCfCrHXt39gkXYjM4Sya4
 Wm17QQbRf8HWV9KyROt7XXigwDL8Zq1kRRqjLeVex8Z1e05GeO8uHZhPZo1AdSYtqq79KE4AYkU
 QOfIySPEbn/eKk77Zehqmva1pUuYonQ5C2S7obZ+fUu182/SsQorB4ypPAhaT6p5F95RQaTKCeB
 WwL+XEDhhLD/PyYOmLN7W9JM7hh5RrvX6DKpSepGTxlc+xq0oj1bM6ejFy4Kx7MQLT9XJAKRgNX
 SDLts5HVhhZ+TRa/FR6IWoU3F5mXxdQ/A3eFy/pRl1HZZlBUJCqgbSLdf0gFwoZo9LnGQV2TfAS
 JJfOHZmVVBbsVJ7Zv0bq1n9X+xCz68yRjR0N0PujZMmgQml1C4f+bLh78tWAKPh+vLsZKr6hGXj
 vJUsC8eGMdmwjXtaTdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084140_526170_273E5227 
X-CRM114-Status: GOOD (  12.84  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-28 11:48:48, Avi Weiss wrote:
> mtk_spmi_bus_probe() stores each controller in its private pmif_bus
> rather than the parent arb->bus[] entry passed by the caller.
> mtk_spmi_remove() checks the parent entries, so it skips registered
> controllers and their IRQ and clock cleanup.
> 
> Record successfully initialized controllers in the parent array and
> recover their private bus data when removing them.
> 
> Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

