Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A9606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uewtU20X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KJj53/jC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8CFFZcn;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrkPpI9a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=; b=uewtU20XrROYjJ
	irGRiCBcPxgAMrNpvAhUyUuHjY299ME94Aa8ylzzN3KLnsiDLNhtMcrkXIA6Gkzsw1X12etdDzaRp
	B+5jAB6BN7ZQ43cHbdtkulSWJ7ltrv2AMgRXTFKO10Ro1YA+dK2L8mP6fjU2fYxF7FfBghvYYfFjK
	E1eL60AznQWAytNyyQJvoQ+KACbuRSQz55Fg7GNjhe3U6xwewuAyNaw2y27LFa0X6HYqUjJ63TvFz
	y9UUgMvyBFm4m7173IhhLLA0QnZNAEjSTjy7c7tpYuhvPVj494UKcVevdxkoRmnxPPXpVuNTvObyA
	vPAqj9uCgqa/QRrx0wdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqf-0000000EBnW-2C9z;
	Thu, 22 Oct 2026 13:28:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqT-0000000EBXU-2rxd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=; b=KJj53/jCHKD+ts7iaK43UCcRyG
	9Bgg4e7PVRHNSePPQYPdpFqNLfq8pZA4+hMZYqHdO6XqFT7SSNKSzOk3maxgTZ91b8CDhgWEn4yhi
	+/aOWJbtsfuVUmP/5O3NWicDIEjmPbifZ0T0LfiVVtoeUCttASSg/Iwtvh7gWpvHkeetBtzfZdlOf
	3lNnHWIY7BzAibFIhdJeKevC3vEvQiQ3cJ8hyav4PLDDxjsGD2FQ7aR7/guCJh+jw2yjK3PBORlGb
	y/PUIfDAMEZgVasSoZSrJA2kYeNOop4GPuzvxACf3dDoYf2MnxflTan5Q+xZtQPuxAdyPz+JYC1u8
	jzEObmqg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqO-00000007Bim-3YlE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MCcfqG208975
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=; b=S8CFFZcnxeDjyDK1
	UwXDhjtwoydfibEOA/Mn/eW1A4RO4Pr+mu0hyxuCaGmWz4FprGpi537xk7D+7lOD
	Xi5/O/Kbs2KBWw7L22+eZ6uQ3mATsNLnea0xOvHYKKwAmLWFF67iNbWUtYK/6aAE
	unOPSH0GDvKZENAdw8T++m4rQbtFquVxKc+ig/v0qVsL1dMB4RsPjizf1KrrMnD8
	kuHxe+xZH3cmkyihrBHH1MgM5x8xILMTY5vfQWoSTQ7BoFHImmIQ9SNvuCu5nYZP
	FM9L0CjPSjYfCoMOpx8j/e3ZTTP34KuZrgrIJxeBojPyGeCoGerWfIPTKMJK1GkX
	vkdzXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cbrnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so387100485a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675711; x=1793280511; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
        b=VrkPpI9amo1g14JHRWvptJB6eTsA5txCXoP5wDYYyXGFsnma9Rl+QxIfzjsXCmgo43
         S3rulRg/MpHzonWFcGANja8THd44N1j6mDQtUz6sw1Jdv9kWAoSEa1J+rSa89ws3jrTJ
         NTVYe6jrlYmDO3JDPn1bo5fkE3QB+ry5phUhD1nM94HDh9JqmZih3ndtz5n1zPlLLf0c
         9ZQk5SO7u1KOMdg2NE891YK6BdacWr4smYw9ohmmRDV7/fNgTVtuqWrAq5+IfbnIxyp9
         Oh59N7UeL5MVJGliinNmv+kjJ/25VLJlM4hsLXaog32UYSHAvcEZWMxVn1PBdUTWGTZi
         aPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675711; x=1793280511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
        b=mMigoEE4g0kfY1+6IgPvtsNkkXFGySHHTr9bVK6Cib/TwUGnza0hM9Pga1lU2ecv6t
         ci9Pxy9XgYd0eLEaXoD0c4dRClgxswJcXH+YrgIPdDKID+z3gDlJfrfsXOVX4WzxIXzk
         oNwL7+pPLQ6z10189lNZFfoDKF/BVHGj5KkZHh226c/rBsyjcy+WcT/e03EV8qciNb2K
         rjiXK8P/k6Gqr9r9kXnYVXwbOz1LKAoSh39jMVFXzWVn42nmOklFwlCIRI6Bm4zf76bc
         Blm5UiGzs+YwLQDyulzy8hCid0LzIHiLTClXC8Ry2alX4szaZnTo8a48AWEjy3zCab3H
         HnHA==
X-Forwarded-Encrypted: i=1; AKwUvBx7ZmlUzNWKUAs5biwTJoE1xTUtuQlt8pslVA96NXaWGr5ew5aCGnEJ1aW2jouXK1OPoEC7Fpkp5u6SvAthgUVJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIM2ye2owEaaIYaQp1H+A7EkzPUhrguNUNuLwXHr48WNR3V2eZy
	pjU8oeBGsfRpAQbRKJSDuZWo6gPe0hulsVpbrZX7QhcpkhiGrgDjC1ncsRXzrnlBrl1WSZLwMcv
	DcyZTn5gJ/yIJ5uDqNrlctignhls9qXmtxDN4iM1JdwOfN8FNJMLyE/NABDnoWlhztKjjVY0UIs
	RK+A==
X-Gm-Gg: AYBFou07oZtusbO1Gc59FLl8I0jNnxp/u+/73kJIbn/otlQr/DviAVWUVQhSMtf1oAA
	pchke7uk6VNZO2P5/k4pMLu2bgs97a0sJr45anf5MEwI/kjbC+2kdH4pUfwFti718wWOJBWf7gu
	tV0kHOHCGXu+b5xMUikJheC1IscQdowEWmzDe5sdmwy9JfdggSpVWHUimpqwzqEXaeJNmwDaz/d
	uCFQZs2RDQlA9AY6+GNa1BoNPSDUclV9gJMUJGUPhqa0eh2fSq022tGpPKq7P3SkTdsvWiHZJqa
	Pqnnf5pazOVHAte/XT5kfYvoiwTKRRjEwOBn8aoNKIdG40/lMHvYASkL58Bv3i9gpabqmRly1Xx
	I3WWhmWO227x4HFKunRoZgm2xtBGkYFQvKmFZ1df5B8BkIbReI94j6vN33a3A0o91N0tob7UVJ5
	DoZMBQL7TJ7XtO
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f57f1d8f7mr941933085a.45.1792675710967;
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f57f1d8f7mr941924685a.45.1792675710367;
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:02 +0300
Subject: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XbnsZm7/G9+6/HZ+XJTOjbptEIAHWIuqiD02f+/AGHg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/vTwOk7t+tp5eoZf2Nf+emM0WXT7iVln2H3mOSzik
 TlX3Z/VyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJnGXkYFjHcl3xl82uvyJ3
 Wp9cXbxrJf/3zrq8wjf81TlV3SGbf9ad392vEaD009si5p+8ZUtBbJPTS4WU/622FvemV++LEjx
 sk3bS7/IxR89aqcQM9cmli4ourm/5eJx5v38RT4Sia+1mHV6tGYuXPt8k8GsK+1QTP+lMkSITM+
 /1Roekl+ucltlmGrnP+aN0iaXg+cdu78w3NHq9669bFx0QcnrZ+40Lt77a97OiX+qhvqUmd58hV
 25yjPmeUnaH5Wt/sX3xmq6k9XlukvCCNSpJ29pONM/SSZdd6LA+zKZM/L7zhwXnix2P5GxKO2zF
 nBgeGdORydXzLuLOpYq1z5yZLjRdlJe4airS/IH/0o8iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX7b4ub+/HtUW1
 jofSGK+lMXquC4ABTY3erSb5ed6WNMMZQRKG4+aLgpUri+pQt3sRixAtS9Vpyq+is7zO+fjoDdj
 FxzW4DzM8zVjHyo1yzED9UbsxEu3eyw=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada0f7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ko0cL7WckLSiMU3Ubvqkb2eyQJLlF1gB
X-Proofpoint-ORIG-GUID: Ko0cL7WckLSiMU3Ubvqkb2eyQJLlF1gB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX8wEfJy1oj4cu
 sZDLM9Ss2EKZ9mdvk9MHP3h4NxBsxVv3Spm6e+19TSW8WPMKB8vur13fVMrvYlX0LUdL8IzcYYz
 C5r5sSEDXu13G7U+m/WFhBPKFWHxTdi0dYxxUaAM0XHEsT4Ftv4+3o2HUsxX0hU0C9elDtJmB3h
 kn08+zTSZDiOkIu0Iy+g+/FxcdCfP0i5pQsIlcC2locVsJ3G1n+qm6Q3LjmnEPYL0RyLOAmgx7y
 c2slZzjFlZC3me9cBeBIGIYkBGaVcOehmEXDlwqBmHZ0bz/0YpVcRCT+OhhiYJPNLMXR35kzCW9
 3UkiHCHDxu/gXLSvinUsYZu+S3DTrj5EFzBMOfRrVMTEfyj0TW002lEp6CC+zyxB3DF/X+99bdk
 lAHeN8UjEuU3KMxPeRrei9xIBdYTDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142834_877408_37CCA7C0 
X-CRM114-Status: GOOD (  16.95  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..6a8b3b8e1fe7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3


