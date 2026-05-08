Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90961CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=; b=ll4OV5g9OhfzH1xGCLP5hmtF7E
	VM2JEmKkOnFxTltTCRi4mOV2O03AxqoesHCwUIJ9lVZ3B7SLJqypRKbWUqthvSWSJ4zETDbJ2GtSR
	TzjuH/S8k2s8jVdDd98tahluv9f+Uob2uTa1MRAgFPQ1CguR4ctmh3VB2a2ImxzgzVxA+bVd1HFCz
	f3ujZQkmK9R+No6eTDAuUySqg7wH93R08oCAC377DXFSuNgzUqij3STAzum2xijnpKNXvK1ZcYIup
	+e+WO7Y5DqXd7NeyxyQrr/lSWFiOY8Vwgq98TLQyyy2stEjE+EFlYkwxGz/3ozrtJnleWlNS6WI8T
	el7LDBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJpy-00000006Pmo-0yQk;
	Fri, 08 May 2026 11:57:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJpv-00000006PmP-47bD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 11:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=; b=MP0g2H4w57zoapPxAuuwztNN2T
	T5lhhlGr09W86g6nxrd39+c1RUBzeQxeriKZ015AF1NiooBDe7UFzUQFsOc4IY5/gTybYw2JAAJEn
	Y6xkfxYZc538+Uw186/mA8AgIlHjhfLzOh3IeZMhYrWDS9KZ8DHdpBw/THZvkVJFB/DZduHCJiUED
	f6umwoAtKZYR+sp+1S0cVf8U4n4WRpJhSBMcJkbIj8CmQnHLE2wlO4XYG0g/Ipm5/Z9lW1zgo2tC5
	gaqHlmso1+MR6bmHbwf9UwY0REVm88zDPS22xTiwMV7B5TqKuBrsN0qz6EMwsojgPbf8EdjoDbk1D
	g+jEFiRg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJOj-000000064Ao-2xmq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:29:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGlg257891
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4n0gQBv7g7lIgSwaGYb3+mof
	ndGuALBc8vtoBzZ53cQ=; b=Eik6HdXMKFPgC6JzNCcdlb5WF5VPsb6EHsZmktl0
	1UpMdQ7b3Jn/28Z5mB88ZMwA6xIGcISEQpqzPESIP3Por1y0/m+6nnlS0ZC+mTh8
	OkpNovdzZxRUo8eznjAKx5r0Gc/qQfrRJCAzxMS53tJSiMxu8u4Rgecuyqwp3+Du
	TFFQch1xeGTE2dz8oBh7kpGNI8DX3hg/LGLYIm4cOkZnhz6vnLcGn1kYBYGZlx8c
	xOQ9SFtBRBKrn/lbwtlvzmWBwAZlgSfoZjaIu4GHjLNMhK8b/crsLx6QTTnPw+qX
	piHIes65Sxpar0A6XF7lcN1jB2ZAaYQvkarq94/FILDJ/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh225-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:29:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso12975081cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778239773; x=1778844573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=;
        b=Tv/pHWI0xMfIsrF/ekvBqbISRv/0zh7THkk3HW5ZyoYLn9wuvTWm3VCUbcjMM7qC9I
         xFR3KrMKVafzI+m6sa7KbjV0Ah9WKcXIxgLKvKRukrrpsdbG9MdxY1aLZUgT4XoaWonv
         oWxFki5DOwfjQ8dDNujRSdcAHy7TNUJDzy51B8A7dioYl9igJtFEuDb3FsbEZaBmMChS
         /zF6eGccJSbPq1QSdAZsvUowwl2oOKlzYBv85UeywWL4FaYK3PHHzINr5AvU1WGHbw0X
         7nu06GogTzkPW0gDuIdpLbSWYOLLvvZs0o9JxxA3E1E1FPpA3gizDIEG1glukJHUxIg7
         ET0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239773; x=1778844573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=;
        b=doMYN7pbOTFo5Z3tWcFuqhwXal2ZqhtpvEQjyNmf+MxqSJaAhkILb6prokWHXhtmer
         52Pq5izvpDU4XijdSIXVtjH45zHauAQ38iycGpyfBTzgg6G9pQSCWpAhjcAJEueIzI9l
         skxFY80PDEdJC43/gK/tWredxl8AA6/l805n9ZYq5BkEoiVsGgotGFbQ/NmeTFaEPavb
         joaZAL7ddSLLzzVLaraWHU7gvrebMaz+/IX7I0J/s0tY3s0U9fyUV2Ly8vvHQS6ZZEL/
         CXBB44q9NhhkCzVVog/oFBBx8ijtbmNnlMudBTFa/8qk4wuGMTfPfWJx38t4n9nXtIB4
         4PxA==
X-Forwarded-Encrypted: i=1; AFNElJ/cr+g9+DVux5lfBuCLiK8nIUEryNeJDyEyNiKy4WliR+dqjN2PaEKDVlZK+icB3hqDpv0i9wedH1dwP+PSInhh@lists.infradead.org
X-Gm-Message-State: AOJu0YyrXAXBk3cZSlJ86qml8KoIhLQ4kWfvowl7pN0akTXA6Dm/4RJh
	c5K6v50SB6Dzs/oY/2BuM02R4Dg/ghUt4ZNKgm6bvF/rMNabNylTx9THO8lrvSnEUMIrhyDV8BN
	+fs+swjsVPlcfYZa5rMslMfKuVlxroWy9+kBlQQey8U3iHiTxLpYzfb7bN5XGaXLyAiKbdDopgr
	823w==
X-Gm-Gg: AeBDiesu4VFR8L8UNBkTIfdXPEad3zG999Qpe55QINCZZ6Xo8NYHQxbrD+L+HpI53j2
	YU/vzf2+AGOIpjwuWSUFUXJ6CUrCXUWKA4HUurExFlCz0EbMfrm3a67I+zc1u4SeVYqPmzaF9Eu
	7Zy1VGm/1G9X/vcfUFAOCZ6sRMTCEdMto74VUpJKM6sENE8Q6NzvBhIiOIJWNhRt8qqNSpKxZYf
	v9SmybQ8oHOi4hBFqbsbLpbY0Miz7mqdYnnilVUZzsVA9+NOTFVImHwLb1zED5dyWVZzqfpovq3
	h6iuQw0P4mQD5TpnNDjRwaYp73XhH2ZVD0UHcxrBrl82bC6bZeePFbuevmRlWvJpXlYVsSXX6zh
	0QxDMD7tYA6OpmeDieCSk8KY5xLqr/cSxlwpTxWTqOTh0TxogAiiLGLpVHB+QmTeGeZKdovjdRu
	pC6/f12DgwmfqxB3PZ1VsDtuysc0Eot3W3rLE=
X-Received: by 2002:ac8:5845:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-51461e3e804mr161618111cf.27.1778239773160;
        Fri, 08 May 2026 04:29:33 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-51461e3e804mr161617811cf.27.1778239772633;
        Fri, 08 May 2026 04:29:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9527087sm436597e87.33.2026.05.08.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:29:31 -0700 (PDT)
Date: Fri, 8 May 2026 14:29:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Junzhi Zhao <junzhi.zhao@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <v343uqdgy65yg3lm7rcv57mlpkudqxrnori6lnunaiiewakhyd@wnxkqhhwwvgg>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
 <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
 <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
 <afyUfcr8HuFs6EKF@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afyUfcr8HuFs6EKF@makrotopia.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOCBTYWx0ZWRfX70lhXQV8FEK7
 kS0uio7/mnhsR8z5kESR2c59FESi3DSh/Ru1LKwMAkIwuO/tJa/BuZN447HN78rUbjP+WxvGoOg
 ClGdXzkS6xVsJ8iZmhgCJ5/DyeGF3bOoYaKGrVPE9V6n1CvNStJmFTynMxgK/ntiyG/49hb7wZG
 Od4HLfE+xYL+8kmQXZW7lX9Mfg1LDVxaK9Ei5SKG0f8UbklHhHwngB5BmRnYzbZtTtpB0ej97vr
 s0JHLKWPhDRXX2VJmIEcGU3KtuIF5fXdIMWuLQh/210jTIfbsjjLPhcHQbSLe3JRXaGmyWFNt99
 exwJdusNrJQgBJ9/opSpKBMnC9BLOPYoQlE7jqqq+7qh3cb+RH+x59Kp6pn+hiiSnyfhampgzzy
 QaF7ThEjWNUL48LG9n8VxKaO7YMOc7rdnAmE1YD5kwCWIrtmx8KAoTIReSxUS2FZXWzr6JmdQA3
 F2CN09X7XbFaniKcPsA==
X-Proofpoint-GUID: 5unIAXW8jcAJfDmYNCuFwXz-0j1kLcDp
X-Proofpoint-ORIG-GUID: 5unIAXW8jcAJfDmYNCuFwXz-0j1kLcDp
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdc91d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=eCKN-1Wp6XfqvTAENJ4A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_122938_567424_91424FAC 
X-CRM114-Status: GOOD (  27.44  )
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

On Thu, May 07, 2026 at 02:32:45PM +0100, Daniel Golle wrote:
> On Thu, May 07, 2026 at 12:51:56PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 15, 2026 at 04:04:16PM +0100, Daniel Golle wrote:
> > > Notify hdmi-codec of the current sink plugged state from
> > > mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
> > > via mtk_hdmi_update_plugged_status(). This matches the pattern used
> > > by dw-hdmi, which invokes handle_plugged_change() from the bridge
> > > enable and disable paths so that ASoC jack state stays in sync with
> > > the actual sink presence across atomic commit cycles, and not only
> > > on CEC HPD transitions.
> > > 
> > > Userspace audio daemons (e.g. pipewire) rely on the jack state to
> > > route streams, restore per-sink volume levels, and recover the last
> > > used device after a reconnect. Without this, those transitions are
> > > missed whenever the sink change is driven by a mode set rather than
> > > by a bare HPD event.
> > 
> > I can only hope to see mtk_hdmi to migrate to DRM_BRIDGE_OP_HDMI and
> > DRM_BRIDGE_OP_HDMI_AUDIO...
> > 
> > I think the correct timing was discussed several times and the overall
> > conclusion was that the correct time is when the actual HDMI cable is
> > being plugged / unplugged. See the discussion around [1] and the
> > captured response of Mark Brown.
> 
> Thank you for bringing this to my attention. I'll follow up on it.
> Meanwhile, can (independent) patch 1/2 already be merged, or at least
> get reviewed?


The discussion that I pointed to suggests that the patch is incorrect.

-- 
With best wishes
Dmitry

