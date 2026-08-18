Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF3FC5DF7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=; b=tqnsLYLZ4IJ4DfPeqA3rJGv7xA
	jJW+4BkYW6+8I23tpSgvK5CclMRPklfgln2pTWTPOgOUdQaDTQPwZmBBKqviC4heHVrAgWEVIKhgh
	wiyjz/hDn2k8YJEat219C6AHud/1CPW21BzE7JfWyIyZFm3YuCS658dwa+P8yyKNq3kserBroTrKn
	Q5Anaw2DOhvIAnLSUxEqPxGfLiaFjqW00TmL80VotLKxCPw9WyfPcoY9uYDffGVJO7AbX0L1jLwvA
	QYa5autuTMalFINSejgJ6FPsnpKwnJHl/rje/cgtRVI/w2cswnq+ulDHhW/znzxEHycFX0v/EbgrT
	xqc15R4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwALJ-00000007AIg-0HON;
	Tue, 18 Aug 2026 03:18:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwALG-00000007AHl-21ua
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:18:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkVbj3370139
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=; b=WkK5frd7fdbUdVqb
	U3sPn10YKKrMrbK6n3tDunsyDRNy11RfIQla6GuHj53JCjCa2bMY6vioFOBYtinc
	gOlm971q3CgYaqI+kw6/EyXvcs+HXi+QXw8MGx1FeP9E4vjmhV1TsG1aZQTl8c5o
	+6KUQR9EexwshPmj0bycvD3sBwvUrvYnyA7J2iTvtwFaxMHZWl3I7774PZpY6B4P
	hX2gSKf69Eubsh3WllT0MP9Eedb8UiNnfDxaztxWzAzPZ8HKMvoI3uTbb68I6Z1n
	5T7M95LY1yoLM8Dj5fk4AnRykjOYcsikmFCEplvgpPX2i21+8aEwEC8iAAp52SvA
	a8QW9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xykc7xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:18:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494cce712so474913685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023100; x=1787627900; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=;
        b=cZzb9hxQVyoss9UNINhAAWZSsC+q5NF8cP1Ga1snvW+Mq0do4RVCZfZv0lrWrhGd9J
         aPrKJ/pYM+ZgNA+c6csrTV7kAXdbvVAu8p+fzJA02bs5ehia3+NJz8ELNqVfIqH110m7
         iG/5jVRX6cw00SWXjzswlBFclukOeKSfljGfVXwDEttRt/uIhHJ5ygGxknYcjwIHYers
         yF3tkAFufcI1O9dJJ7YzhjLe3VW2bKO1Z38wWCnU3Hkn8Pqxzkxn2nrw6ml9gjd4B23F
         vQV5POqJqBT+KmnwkgIVgd94Ipdo84sN4bBAUf8PwHJa7BT2AvP34EQuYFb1Lr/4Dk05
         UBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023100; x=1787627900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=;
        b=lwqOQ+F2C7Bkgcpvkl/cSBnRiR4YzzAZVb3gnIyBK5rqQfBMuy6Si4dZoQS081uMwK
         T7wTnwdo6EA8mbB26+BCu0KDB9Jk1qhh5MhQraplHAfXzcDJuC7KbwBgqisPuJ4XZCht
         wy/yPdWtyQwyjYBkZUUfsutToysNOPSn8I7D1Zfv0qq6CtaIlLVNaXlILivt7O5EcAG4
         ZvvUefF0WK+L74baQLGoN8RSj6crj447qFtHk4TcseCrdhKs4rkrdCUJVJ5hyt1OQt4w
         DTb/dZcdr7vKloIp29Jf6DgofemDAqO3LeHRp8I90s9+8wCTocI+Ox1ycm2V8lMLGbZo
         DvkA==
X-Forwarded-Encrypted: i=1; AHgh+RqD6jOzaNOTl1tYcIWItSJbWfyaxuKw0FvQJE362r7E5qmmPq2Tk3YrwdKg0GgFqg6UPqUsr9Tu/JrFMQ3aqNbS@lists.infradead.org
X-Gm-Message-State: AOJu0YzEL5ulq9LVG+acu+7eug9Dl69Np0YQ+3xLL/E58n9TfIHpJ11+
	940ml347dvP4Axenre5ELX8+v6g4SMcaJicMo/5Q4HWoS8QhfC6Aa1SlWAwKFo1QMtlkjlbLTNI
	QwXqymicWhm7TQ09ZK3sZWo+ZxDRLUDmxr9N4/dtGUbJcFoH3qk0lheLXRG2ilGdhVwKQ+x2N87
	gClw==
X-Gm-Gg: AR+sD13UZXcqi0dqDTFRpHfI0gN8a1OkLy6nJijrmbbrCdw9dc0fL7QqGwwfUKwq7Gt
	B5/cWG12mfPn1UNr4wkxrNbq+haknSHaLUgvpaMykr6x1CWwEpQUzNctP2+oVrKDOCkrjQ/LOoX
	6SAfoIOA6jPKBaQqA5yk6Vuk+ePHmyLEA4jfho3b3OdY1SLhOjUkx+tIR9+zsXTB7++VC4B/s+j
	rkcEf4vqim6a/ObekXdHS4sMa48xP4fx410v0HeomAvBPo0xPIspmx1U7DBab1VCDKtQAp6V2Tx
	iqTcmpf3+ZdSSppxHYJNtjLE3HiXPbUeyPzbQQnUr0svQryVfzJBACtQy1CL39yyx13oJII7tYK
	V1Y40i0GoVl4IQwO3otCC6ciPSXCMKfs8N/7shzwfNL82ZrM7+7buL5eXwnYT83JRVAiSXW5enD
	Bfmrohlw7A6dtG
X-Received: by 2002:a05:620a:261c:b0:936:dbf1:f4bd with SMTP id af79cd13be357-93704beb3c5mr569254885a.47.1787023100491;
        Mon, 17 Aug 2026 20:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:936:dbf1:f4bd with SMTP id af79cd13be357-93704beb3c5mr569251885a.47.1787023100020;
        Mon, 17 Aug 2026 20:18:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffeacfsm830534e87.54.2026.08.17.20.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:18:18 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:18:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
Message-ID: <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
X-Proofpoint-GUID: UESYeDmOuOHrYMzLWkBlkQUHekX6Brju
X-Proofpoint-ORIG-GUID: UESYeDmOuOHrYMzLWkBlkQUHekX6Brju
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a83cefd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=TwwRWlU4pX-Acn9O6hYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX9Ownyd5mL+C+
 uC+H5nGmHomiUFqlA9eomcysfa0GeAw1n69hAcxNVf3nq3xLhUnvLKzrgN1uH7+fTuJw7sXdFDt
 KHX6ZBfk+ho1L5okcn30JJGJ+7j0iU+szqTj04nTDHtioD8Td5TRj2RMVXpPskI4ISa1LVC6B32
 yWNj7KYLt4wzWbFAw/o1gAjZ9fiAaSt6E2IyZ8QRsY6otz74sFoXQnzJNkFlf7HRtn1YqPVMba8
 XRp9zHXnApC/DxrsP37tyA6qh2HF+NZjR17NSIZ7SUsfzRzTQs1HXCR+B/EILmP++n3+mJI0+2f
 4Ep6837MFImmTeQnc9Z6iaobRITPVBLrQ+wthVX0Lbnhrg/jkBA/T1w4ynAZFJXXbhiwBhXmc0j
 dVaq+lo0x+PdVfTe5bsCvGDAwZjmed55OmM/fT3rF3qtXPEq4jW4Im8eBCS49TAo4CtO2FtxW/R
 +WFXp41HvI3MkhEIUmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX8BMFpR4UQdqB
 Qg+VTyO5/d225IilFtheAxrqRL9EpN+W3CG4kLBbHr89OmvyHp0fdoelXRmm9h6Y87SUGzOMDJt
 YDEKeOlZE92ICm0hgvAFo7L5ljxhjWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_201822_645085_EF71CCCF 
X-CRM114-Status: GOOD (  55.67  )
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

On Mon, Aug 17, 2026 at 04:02:31PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
> > > The bridge connector HPD handling path currently updates
> > > connector->status for every hpd_notify() invocation.
> > > 
> > > This does not work well for IRQ-only notifications where the event being
> > > reported is carried by extra_status and no connector status transition is
> > > associated with it.
> > > 
> > > One example is DP MST. HPD IRQs are propagated through
> > > drm_bridge_hpd_notify_*() so that bridge drivers can process the
> > > notification. During MST operation, however, the SST connector attached
> > > to the bridge connector is intentionally kept disconnected while the MST
> > > topology manager handles all connector creation, removal and hotplug
> > > processing.
> > > 
> > > Updating connector->status for an IRQ-only MST notification may cause
> > > the SST connector state to oscillate between connected and disconnected
> > > depending on the notification path. These artificial state transitions
> > > can later be detected by the polling logic and result in unnecessary
> > > hotplug events being generated. Userspace then re-probes connector
> > > status, potentially triggering the same sequence again.
> > 
> > Then the API might need to be adjusted.
> > 
> > Remember, we have two usecases, which we must be able to interpret
> > correctly:
> > - The driver gets separate HPD and IRQ_HPD events.
> > - The driver gets HPD and IRQ_HPD at the same time.
> > 
> Ohh yes, here need to rework.
> > > 
> > > Treat notifications with status == connector_status_unknown and a valid
> > > extra_status as IRQ-only events. Forward the notification to bridge
> > > drivers without modifying connector->status.
> > > 
> > > This keeps IRQ delivery working while leaving connector state management
> > > to the component that actually owns it, such as the DP MST topology
> > > framework.
> > 
> > How is it handled by other drivers (i915, amd, nouveau)?
> > 
> i915, amdgpu, and nouveau don't go through the drm_bridge_hpd_notify()
> bridge chain -- their DP controllers are integrated into the SoC, and
> HPD interrupts are handled directly in their own encoder code.
> 
> MSM DP is different in that HPD comes from Type-C / pmic_glink altmode
> via aux-hpd-bridge, so it has to go through the bridge chain, which
> means this semantic needs to be extended to the bridge API.

Still, when do those drivers send the HPD event in case of IRQ_HPD? Or
is it that in their case IRQ_HPD just triggers inner logic to reread the
status registers and then the driver sends the HPD if there is any
actual change?

> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > index 5edca47a025f..7334d6677604 100644
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   	struct drm_connector *connector = &drm_bridge_connector->base;
> > >   	struct drm_device *dev = connector->dev;
> > > +	/*
> > > +	 * IRQ-only notification: extra_status carries the event but
> > > +	 * status is unknown — do not overwrite connector->status.
> > 
> > But it's not unknown at this point. The connector status is reported
> > following the HPD status.
> > 
> You are right, in the SST case the bridge_connector status does follow
> HPD / link status -- because the bridge_connector itself represents
> that SST connector, so its status naturally is the link status.
> 
> The MST case has a key difference though: the SST connector must be
> explicitly marked disconnected (to prevent the DRM framework from
> enabling it), consistent with what i915, amdgpu and nouveau do. In
> other words, once MST is enabled, the SST connector that the
> bridge_connector represents no longer equates to the link status --
> the real link is managed by the MST topology, and the SST connector
> is just a placeholder at that point.

This is fine.

> 
> The issue is that IRQ_HPD still travels through the bridge_connector
> chain and takes the old "update the SST connector's status -> emit
> hotplug" path. Under MST that runs into two constraints -- and this
> is exactly what this series is trying to address:
> 
> 1. The SST connector represented by bridge_connector no longer stands
>    for the link, so its status must not be overwritten by IRQ_HPD
>    events.
> 2. IRQ_HPD needs a clean path that does not trigger a hotplug on the
>    bridge_connector -- the MST framework already manages hotplugs
>    independently.
> 
> Using connector_status_unknown as a sentinel here does feel a bit odd;
> let me think about whether there is a cleaner approach.

The status here must represent the status reported by the corresponding
layer: be it DP ALtMode, the dp-connector driver handling the HPD GPIO
or the DP driver itself handling the HPD pin via the state machine.

Is it still an issue if the bridge's hpd_notify() callback determines
that we should not be reporting the event and drops connector->status to
'disconnected' again? Why is it an issue? Should we instead filter the
HPD events in the drm_sysfs_connector_hotplug_event(), making sure that
we don't send duplicate disconnected events?

What is the expected behaviour of drm_client's?

> > > +	 */
> > > +	if (status == connector_status_unknown &&
> > > +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
> > > +		drm_bridge_connector_hpd_notify(connector,
> > > +						connector->status,
> > > +						extra_status, NULL);
> > > +		return;
> > > +	}
> > > +
> > >   	mutex_lock(&dev->mode_config.mutex);
> > >   	connector->status = status;
> > >   	mutex_unlock(&dev->mode_config.mutex);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
With best wishes
Dmitry

