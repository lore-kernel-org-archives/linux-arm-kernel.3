Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B35BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg3ZT4srw+6aryFi5Qc7G2dueXIKHeooH8YunyQ+fbw=; b=tEt0DiJ9W+K9IGA2b8JEnqpdVJ
	6WFeP8OQbEh7rt/1ZEHtR20PX/Tk1yyteTIJZ4Sl2dfuAQrZ1YUhrp8EPeoY+J8ZodIRpyTOKJKTN
	VmBBiRPgl1ijKech8waVphDvS1LIP21bMuVSF2jOhDDknfF9nxMU21ip0GmQzbuV4fm/8pq6+N3P+
	gu7bk8yU5MRBhdalvnrGirfp3DgBMdT6pm8l9dKdpv4fvtpDJjmmOTmJAdQBo3OFetnJer61vretU
	IC6JUNV5u6lQ4pRNTUd+M63CO1mYb5YMNa2RESKVsKvISDcGXSzg+YMgtZlETmwOPsUmnTFVy/mWC
	NAa9SXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u293N-00000004DSU-2fsu;
	Tue, 08 Apr 2025 13:31:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28Jp-000000041J7-1oka
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 12:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lg3ZT4srw+6aryFi5Qc7G2dueXIKHeooH8YunyQ+fbw=; b=E+FTkJ19Cwe6JvcYdA8af8oGL9
	67Z4drOv+FYcCL3RbOlOunGCrPS5V95+WLeb0Xud4jlhSg5DMU8s4YvoP6uF0M/uPN7ZbCrOi0lhz
	ZdLmCEVCeCJa6mL6BLb1NnemnEG2AaNF7Nlsvg3T2yembpt1eNc64clju2jn4tdCTeQe/e5SNoQLC
	M/xnCSBKORAfP+0XXnLV2bWjLXP9CXcZuVqLGMlgQMKWKVu5ax7oA7JS9rdQOJGikJRj8uws5jJBh
	zsqSQGwTQIGFCIVOzYo0P11c3Aq8fQFAVvWpzWh8tiGeTMF1MrJL+5y/maheVbUhzdjteijUftr2p
	ySE1/cyQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28Jl-00000008Ikm-3Z1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:44:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BCaOf001763
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Apr 2025 12:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lg3ZT4srw+6aryFi5Qc7G2dueXIKHeooH8YunyQ+fbw=; b=ovuATnNAylzikAyd
	WtOcoK/ivI0Z1bAvVeZIcWUM0vUOKBVIFq1RIDSG6DOTo6g14E4X/kfM8FHcayzZ
	60RyeWAWGrY1LETgrU1OQTE94j923Igv32/NuaYlTPz0Gh3dpN2pxPNWbmRjzjZ4
	KZADeWIh059zhZsxgvrI0UhKbjoY3wWAIkxwEU2UHENveZagtDZpmYjeoUdXzk6I
	CHx8mEf2FDsuI0V6lPCnKQCmmBYLzt9VczDOsESP4g7ql52bytZH5mtGUDKOlfD2
	ACwfVqCLTHX8nmSZOfUrvaG61wc0WvOXe9l4n3vXWZsPZY3ddxrLpuQSCrFWYNNT
	4qY+/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7tah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:44:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so584773585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 05:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116277; x=1744721077;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lg3ZT4srw+6aryFi5Qc7G2dueXIKHeooH8YunyQ+fbw=;
        b=IzWqpZ7epIyiqan4F7SP/nnuFnyWFzUk1pl5ZSUi2RiQlYDa52bI8Xbm6Ob0ytrQ4l
         Dt0dLAgTj/HnPRyjvxJZ+p3DzOGysu5Om1ctaJPx9enfsW2o8Fl05rBtdLh/ho0jEuo0
         OCtabBwlIforFnYyVpTvciZ0MLpI03ZeT0bvGk8yCZXPwJ82/zvyB3PsSw0xxTGhTxte
         9HcWbs7oJv4e672+5Cc33+JjouZoQFMcTjhq875WGweluw61Ju1E71ZmFysgO3Fiwi+h
         CfaXTZu343Fjc3uSKlgvHzyL4S1ZHEn9LwERd12fl2c7OEMeUlgl+R8EGLhrJg4xkDsO
         32FA==
X-Forwarded-Encrypted: i=1; AJvYcCUL+HHGX/CnJLmsQ5dhaPIvZ1AphAcx62S1Pt29FCd42raw83+urzDYZ82Q7t+fHhVZW8DGo28Sm5cypO8wkwwo@lists.infradead.org
X-Gm-Message-State: AOJu0YxSAB/eA8+QnFvg/hfSGIEVxvo/XpL142z/ACzYrV18U6MKH4Se
	S5odMZSmLHMlnP8R5YiU61ApXq8AWD6epmskldMAbJBuo3qVKmrP2RsbQVRJ725Xo31qHVhoHWF
	Lcl3GRj34XnJ8vWHeK2gHSg4827n5o6uUTamKbslBvnvhdrxd3rDHxpehcRlG/dYXIIIDQvdHHA
	==
X-Gm-Gg: ASbGnctpjYzeSijFrEun3rC7jZH+WDqKfBxSZeXvuNlo5fCzWoyp7FEuZ0dmobaDTEl
	1sWoL7ixJ4pb345jKK9SY8HmC2jLgK7vrSTatPQrD+UTD8lxX//BF8B/iA99OVuGgY9pjfk9y+g
	WxH+H3zNptWy5qfSdTSGl7jnbxmxorG22gsip6tEu2j15mffyk4lj8Mvq3khdx+Ac66WVY7Ok9i
	LMZ92SlMhIiUhPfsyNYSa/rhHNQycSuhFEIbrxVchsekvUGk7W6Zzy7jNqay4SRfCLmkDhuoyIb
	pXyya7Dm6srhjf0aS/5C1uW+HSIsajq6h0GXgSKtI3qg8MLkc8Iu/TF3NEiXudaSU0SsJtwn6MD
	mGFg=
X-Received: by 2002:a05:620a:1918:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c775abfc97mr2255088085a.45.1744116276752;
        Tue, 08 Apr 2025 05:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG22ST879wU1hj8qKN5DvkfkmnnORS8BpEMeXnfFTdBQ8zZsfg2IPMrVXraLLg9Li7ARcMaQ==
X-Received: by 2002:a05:620a:1918:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c775abfc97mr2255084485a.45.1744116276401;
        Tue, 08 Apr 2025 05:44:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e6370d1sm1512901e87.143.2025.04.08.05.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:44:35 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:44:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: Alex Bee <knaerzche@gmail.com>, heiko@sntech.de, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, hjc@rock-chips.com,
        mripard@kernel.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 7/7] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <yjxr7dphzm7rbuf7mfpkat4k2vssk2qxio3esvjfhd2ygq6byo@kag57knzrj4l>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-8-andyshrk@163.com>
 <680a40a8-07c1-4dde-93b2-337ab15f7afe@gmail.com>
 <618c65eb.b8a8.1961550f5ae.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <618c65eb.b8a8.1961550f5ae.Coremail.andyshrk@163.com>
X-Proofpoint-GUID: N49CMcGv9gbs70vqEb56OY85Z-bpD-V_
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f51a36 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8 a=s8YR1HE3AAAA:8 a=RRhK3aCThXU4g2SLoiEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: N49CMcGv9gbs70vqEb56OY85Z-bpD-V_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_134442_405312_CCE26EE0 
X-CRM114-Status: GOOD (  28.89  )
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

On Tue, Apr 08, 2025 at 08:12:29PM +0800, Andy Yan wrote:
> 
> 
> Hi Alex，
> 
> At 2025-04-03 01:24:22, "Alex Bee" <knaerzche@gmail.com> wrote:
> >
> >Hi Andy,
> >
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> Convert it to drm bridge driver, it will be convenient for us to
> >> migrate the connector part to the display driver later.
> >> 
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> ---
> >> 
> >> Changes in v3:
> >> - First included in v3
> >> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> >> 
> >>   drivers/gpu/drm/bridge/Kconfig                |   7 +
> >>   drivers/gpu/drm/bridge/Makefile               |   1 +
> >>   .../inno_hdmi.c => bridge/inno-hdmi.c}        | 924 ++++++++++--------
> >>   drivers/gpu/drm/rockchip/Kconfig              |   1 +
> >>   drivers/gpu/drm/rockchip/Makefile             |   2 +-
> >>   drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
> >>   drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
> >>   include/drm/bridge/inno_hdmi.h                |  33 +
> >>   8 files changed, 741 insertions(+), 763 deletions(-)
> >>   rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
> >>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> >>   delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
> >>   create mode 100644 include/drm/bridge/inno_hdmi.h
> >>
> >
> >...
> >
> >> +#define m_RX_DONE			(1 << 0)
> >> +
> >> +#define HDMI_CEC_TX_INT			0xda
> >> +#define HDMI_CEC_RX_INT			0xdb
> >> +#define HDMI_CEC_BUSFREETIME_L		0xdc
> >> +#define HDMI_CEC_BUSFREETIME_H		0xdd
> >> +#define HDMI_CEC_LOGICADDR		0xde
> >> +
> >>   struct inno_hdmi_i2c {
> >>   	struct i2c_adapter adap;
> >>   
> >> @@ -68,41 +395,18 @@ struct inno_hdmi_i2c {
> >>   
> >>   struct inno_hdmi {
> >>   	struct device *dev;
> >> -
> >> +	struct drm_bridge bridge;
> >>   	struct clk *pclk;
> >>   	struct clk *refclk;
> >>   	void __iomem *regs;
> >>   	struct regmap *grf;
> >>   
> >> -	struct drm_connector	connector;
> >> -	struct rockchip_encoder	encoder;
> >> -
> >>   	struct inno_hdmi_i2c *i2c;
> >>   	struct i2c_adapter *ddc;
> >> -
> >> -	const struct inno_hdmi_variant *variant;
> >> +	const struct inno_hdmi_plat_data *plat_data;
> >> +	unsigned int colorimetry;
> >
> >thanks a lot for doing the bridge conversion for this driver.
> >Please keep the custom connector state which was introduced after Maxim's
> >review during the last rework of this [0] driver. The colorimetry is not
> >part of the device, but of the connector and thus should not be part of the
> >device struct.
> >It's, however, likely that the common (hdmi-)connector framework will once
> >hold its own colorimetry property and then the custom connector state in
> >this driver can go away, but until than we have to keep it here.
> 
> After converting to a bridge driver, this driver no longer has a connector. 
> In this case, how should I create customized connector states?

You can subclass drm_bridge_state. Another option is to follow
rk3066_hdmi.c and to pass mode to inno_hdmi_config_video_csc().
Finally, you can just extend the drm_connector_hdmi_state.

My preference would lean towards the second option.

> 
> >
> >Thanks,
> >Alex
> >
> >[0]
> >https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ceeb0f0104a62c867656c2730a51df47e7350b8f
> >
> >
> >>   };
> >>   
> >> -struct inno_hdmi_connector_state {
> >> -	struct drm_connector_state	base;
> >> -	unsigned int			colorimetry;
> >> -};
> >> -
> >> -static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
> >> -{
> >> -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> >> -
> >> -	return container_of(rkencoder, struct inno_hdmi, encoder);
> >> -}
> >> -
> >> -static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
> >...

-- 
With best wishes
Dmitry

