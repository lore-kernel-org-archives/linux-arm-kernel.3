Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6972CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl0OxxNA7ca072iJm6M/zPG6jGGT3ai/1U553419los=; b=LEHJFrnoDj5e9xuYID98mhIWD9
	WhLigeGLkUD4H6ZYYV1TvHmNIU0eJuz89yRfpaX2d4bGHNW4LYX00TAVjAiVRWdkBRMeAeKyRV922
	fCh1Nz4DnxRElPFdkUlfGoYCapzo6Z5JCBfIZQ5O4NJVQAhqvifwURDKqHqMc4tr86D/zPl+qISAI
	nsAQvSe6SfhsjsO90p38Q70fn+qrc+SUQ4NSl+E37crvrg/i/AczhNpKJCyqIF1qsvsmtGgb55xj8
	9lqOIlWaoYFH0jBKYZ/3LyaTQpQj3oVK+uOBJP0sKewIIo2M2dyK3j+BAwozjvl2P7vbcCLiJrPVB
	I2TMmeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiKgb-00000007w7K-1gpL;
	Sat, 02 Aug 2025 22:26:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiKe2-00000007w1d-0ish
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 22:24:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 572Le2fN002364
	for <linux-arm-kernel@lists.infradead.org>; Sat, 2 Aug 2025 22:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xl0OxxNA7ca072iJm6M/zPG6
	jGGT3ai/1U553419los=; b=aeMnVJPpOqTPR3I2WDmw51lqLpvUV2fYhyARPtzJ
	SBY2x5WNIE57zCPGcVper6imusSo8jxDorgVgWeJX/aCGimBRqOdNIqF+WBI6uq2
	6nHGncnFUryddtwt3fyA80U5I6LqtoW6pHJfOWSFjzspVoEbk2xGx1GPQgOxl4WY
	fvF8d7J2RFihfDNHah1LU2RCO3LBGxZVFpnZ4OB7fu6ItVyTwTZnLt17G3F5BPe0
	+rVzOdk9X/GFYA4poaOBg6Lrdk5V9Ism/2L0LX+2heAaaBLpTMa5zcFH6vKbCh3+
	GU5sp+rKsLgR8ph1MVvu97s7OnDKIPp7fR1C9fHarRMeYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek1b57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 22:24:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4aa826c9464so46970801cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 15:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754173440; x=1754778240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl0OxxNA7ca072iJm6M/zPG6jGGT3ai/1U553419los=;
        b=ELuhzOKKSjXi3dGr6NYKQ74+oWWawFEXIl74c64McpJQwEEzcq1tpql1SViqev0Vvx
         sJNAPpYEJ0hfr69p6kspzrAuIg9qz/7waIj0Xe6f29FntmhhM1nFVKwJ80MYws7StLW4
         csOk+BjMmqejLk14cTGpknK5tCygZypb05NIo8hKthqJ6KINX6dbTA1thQAmQjrBSIWy
         w/jQc0A/+JJD2mhnKKy4mIEyLA8sbRUrv5SIm9SfwPb3BVayf3qckw+qEx7X+FXPFpvR
         nru4c8n8zaveEVEZtARE9RhrZ6ZxZCSRotvnnWM06fqWbxmOLCoWydYe1rT4YITCST8q
         SIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+f9hJrjaApFDrlO2G0q656UmIcpiA+kRBZrq1gc9zEsA/CadCEw3cZOE8fkbcJek4xG3CzG0RUBtVeOhw9zeM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9oBkZcfqXzpjWWmfIDjEp9DwCVH6znHoeQ2/HG1fYeuad0bgT
	N58hWSa5tvV1L4pHig/Qexrlp1FAQGfr1uiQlYN7m423m/ZCAB2cjN5sisWkFVnsz5ZNeh6qZFi
	H01qugBQEXyy4HCHH7v9+ucr7nx9i2il+iGxbjXh+4y1K7evvYdw8L4YA2oJYFW+yNM9bpFjNX5
	MPbA==
X-Gm-Gg: ASbGncuXbvZjLxiUbpvEsPaxLxXZkxzRKdZ2WQVEFKp0TrQX1Yk96+NJgnsLJmgzMki
	TrEZCRGXvZUzzz2QOiG0wHAH7gS5omJ1UReqf/55+oH07Mi4DcgTdYSJfoWjMXyb2RUEuJzLFNu
	nGpm/tRY1KuJkT+WrcJ3kCwEL2r5cOEL7n0VrjDc45GmpouQVOlzDd9RY5Ps36yq7pI2ru8S6+D
	SzyiTXENNXE2cWC9A2pA/LMCZ2BAtLEDq0ipexuR6yp2j3LFFpbXnFf5xa6GelM717n+RD2d/Qd
	szv87H8rezrUSV6zdDRZXC8MS3LIjvL+thzkTPkGayhia3DOKru8zAXf0oztEBZlRZCWkaTK6+W
	DtB/MJNBM7Li6AnNgVZ9Vj7rbIQD5fX8jm924ckZbs9SdE8cbvnki
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr71116011cf.38.1754173439774;
        Sat, 02 Aug 2025 15:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrRsxcmSymm/iOQUBWA1JUQnU1xwsXzPXR9p1T+dpkt3Av38hBwrNFCZmoKC0DXjNEzzqClg==
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr71115661cf.38.1754173439390;
        Sat, 02 Aug 2025 15:23:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca6776sm1105446e87.141.2025.08.02.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 15:23:58 -0700 (PDT)
Date: Sun, 3 Aug 2025 01:23:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
        jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
        dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
        ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
        jason-jh.lin@mediatek.com
Subject: Re: [PATCH v9 00/23] Add support for MT8195/88 HDMIv2 and DDCv2
Message-ID: <2eq5je6xk4ly5lxijit3ufor7pmm7mgivbuigzr35lrbe2ryvr@3axnsyabigm7>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=688e9001 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=k3YYP44_YlkhweOvE2wA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDE4MiBTYWx0ZWRfXzCNJNzGKjO/h
 w0Fx3q3e6MuhqT5z32Lo5XRKtDasmSBis8W9BeWH312XkE68lTQFWKpxGJT6+TEYjbzmpN2ZhwT
 CkXO79mw3HwDOMNI45ZXPn3FweAEvMp29mG95BxoslDoUgZxyl8kNGFRfd6A14msX8QRb44jqYH
 6DcfozGWDolTA6x/TWA6Fq370cpOAVCO/sWTPX/W6oZnHlXSw/w9BCYYw6vz46GU6ROaDzyuIky
 qR3sPlK1uHqslkW22Mi+IlOsMmUjvkxABXYpAnyNrGUgqnp+4YIHPL7yGloqrgpj1PSk9v6XyCc
 oeuqCmUXeuXduduqpNOlzPFgYpOKpPVyUlSSYfGn2JK2+qIuCDZA+doKvF3w8ZOnIaheMRM33aT
 O8vl5OKknnAiwc7SwGT0SlwoB1zZeOVxK8//BUsA0SSp16lmXXJPoEXx0pt6RRIqs4Zer3W7
X-Proofpoint-ORIG-GUID: DIKYAG5Pk6glpCsZj-N9_DOoaeV5neR5
X-Proofpoint-GUID: DIKYAG5Pk6glpCsZj-N9_DOoaeV5neR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-02_01,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=743 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_152402_230571_91C142BB 
X-CRM114-Status: GOOD (  15.49  )
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

On Tue, Apr 15, 2025 at 12:42:58PM +0200, AngeloGioacchino Del Regno wrote:
> 
> This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
> the direct connection DPI as found in MT8195, MT8188 and their variants.

Angelo, just wanted to check, what is the fate of this series? I think
it wasn't updated since April. It was a really good example of utilizing
the HDMI framework(s). Wink.

> 

-- 
With best wishes
Dmitry

