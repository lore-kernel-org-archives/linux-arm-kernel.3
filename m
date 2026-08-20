Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F21C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 20:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1EKTu26kV1k/zTZ6yeRd/KPqj8crXBIAA/Z2wVIOlw=; b=VQGarLVpAWzJVA835kyUEPkKaz
	dexYmSzucHxNXe9aNxyWgZQsxZlhfWEod1ha/3t5eLl4f80trRU0ML8Amb4Qcopqa+KX6bdwX4WIP
	TDXsWPT8FP47Vt16H1Yp9LWg+ACXjWSM+BNH7a5JYDfXBDOoMMdjq0pJcNShC/rKCiSJ86hZlIARy
	YwuaFeE6TbVKehLo2IelXBrQjGqCOpWHV6v1Oh0Kzdw+UfsECx1vzz3fwTLwh9BDsLDjiTXpFpGxW
	4FCoYKHvfSXffOW/cvoEFbMNPrX09oZg6NOLypDgywOyw+KyXWZzXwoVE++hiKtWWfUw5M0oco82L
	sHMi0T7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9Px-0000000CAmf-3RlQ;
	Thu, 20 Aug 2026 20:31:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9Pu-0000000CAmK-3x1A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 20:31:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK8L4c4032141
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 20:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1EKTu26kV1k/zTZ6yeRd/KPqj8crXBIAA/Z2wVIOlw=; b=hUnjHfMq3wDSxEt3
	LtRZOBrgRnt86KhqqCKBTuLs0AU3Jo7M4pk058vQ2x2sknR4Bao6CmlXGFKgqJ4F
	/9e53aiSdQT8qvmYgAPOtjp/jOSjXHDl5IIZoy3q/eL9O++R0NO/dlbMmS+WXQAH
	KCpobukRIq4XircAAZJ+KZt5nC8n/Kot0TyQu9ar3jRcN5EGe+7dpsSFlCiU0S8k
	D1ZPISwoEo8A5aizh2Ys4awoW9srY1N4mr0LkjHaxQSf26bcDdWnhxI7Yh168DkV
	Ahshl/Osfwh0wlG0wJKaQOCfwCQCM1nvav4Qo9bCu1Ec7Gji6tcly44FoKFF2j/V
	VV+thA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbvb5ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 20:31:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so31143485a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787257872; x=1787862672; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R1EKTu26kV1k/zTZ6yeRd/KPqj8crXBIAA/Z2wVIOlw=;
        b=MUEkZtikyioM2QrjOMzyZXhnuNMoNxWO3ItGCDzdNcm9T/1i/S9Lu2lcxSvOQs/7r5
         skOo2s5ZXHB3ZtExQObSyDTS7wQchI4bTJWGMsdbZZFyVwA6nQ/PRSsCxKC1OX0HYhdA
         NoJ2m/cRV+JZMKVU643KV0AG5mpb3cEcBz6qTi5berZhIaggdKfvp34IJ5fHr6SVCR89
         AMnTg5GlUxBlqRFxTsFERi472dBtxxI1LsMbh8A8cUJoJfqHQqf0cqf91wU+iWqCKsXZ
         O7d8Inqr8Vog6BNyrTmSM+O0vG4EpTjWBCYtI8lRn4CPfs15XwaiRbHicA5AeRxSWNbz
         vLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257872; x=1787862672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R1EKTu26kV1k/zTZ6yeRd/KPqj8crXBIAA/Z2wVIOlw=;
        b=eH8yPPfr5wPajhErK3ZgE92jhHaRsbKipk4IVcvZHwKtu1rK6Wr4610nfO4nQ/cHle
         zB4/YEmJk/zUhDjAR0cdlyA5hmGzfJl1o0TwjNu6yDYTa+CwVCjblQL5XXlga3ZSAURL
         Lr5nEIIv5/6XXIkpO/XqArlToPr5AWZrG7+OZpXri8wnBI43qvVUiMIkZkhVrJbHk5Xj
         wPiZYSCFDv/FTw2OZriqVtS1xSL/v9D/tXYF9zVNKMO8Ugcp10wAZnW9u8WbIi3eNQ/z
         RYAq9xO2f/wPU2hijv7LGnMSy+7k98TYVA7YC8LN3NEs1wrQmJh/pq2edAPSqpSsSEyt
         rPEw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1RZuM1JWaBwexGNyumFwmbIoNncoJNMT+jqd/ic1zNgwuCcDaHIqnwt0XDeTRsp/6iS3xySvwNcpcOi/JKtmo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx43T0tD8qOrMDkY1RnJpPH5CURoYxwW6qYQFEwSKN8VOKRVbuQ
	Rd6bADV5eKqrTxUUmqzxiQo8DuUV574CKHJ8GAMKkC3R2MivWz7PYCK1VEvpilDD5yXDaqg3Q/4
	sLsdOp7bzbW0snPK8z8L5BLOhHsZiWybK4C0TqcYyQnxsMc2zfPVc0gxyIvo1KrN4HVVPI9m9DC
	7weQ==
X-Gm-Gg: AR+sD128shAAtqs+JmAu3EdqQ4vjIfqQ83ILIWa71mHBjYyW5o12a/dzTCW09wbp2pq
	A9MPrbrGt1QrYrX1KCUdFhiMUafEZ02KWZ6u6X56MhL9PM/pKyGXLa9IVrmuYfVIfgsDZrr6gEB
	C/9IbY4iJ1lEJ3NETooC8epxTEN/LrBDBmkydn0yDVP+AmEqhIhXioUyzqp//1tRCKEE8lvfzlO
	KdSsTWyxxPF5pMTIoDBNIOR7ysW7wgFjjPz+wprmqxf0GHbAfo1Teu1YE/3g5vpBM8DBjKbJUje
	8D7tTUtqBkO29Bq/1QUrLJ39hW7gf2DOJ7QlStQQB6Oppmm+ceWg9GODPLpRqbgV11cfQz1gIU9
	XeS+mZk+vKIT2U5w=
X-Received: by 2002:a05:620a:17a3:b0:923:7821:dc0d with SMTP id af79cd13be357-9373959d6bcmr80202785a.33.1787257872222;
        Thu, 20 Aug 2026 13:31:12 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:923:7821:dc0d with SMTP id af79cd13be357-9373959d6bcmr80198085a.33.1787257871697;
        Thu, 20 Aug 2026 13:31:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d98b0sm125834266b.6.2026.08.20.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 13:31:10 -0700 (PDT)
Date: Thu, 20 Aug 2026 23:31:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Subject: Re: [RFC PATCH 2/3] pmdomain: core: Add a genpd config to support
 unknown initial status
Message-ID: <wuunnksblclkor2icjtcgqiran5ryurzgrctm6by2svariwc5b@5p2tr2bdpvw4>
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
 <20260819151457.256959-3-ulf.hansson@oss.qualcomm.com>
 <yuowf7hfnhcizjgxglfypsqbf7oavh3jywbls5mdbuyc5rglmn@ejp2tahonk6r>
 <CAPx+jO8MXQwDh2Bvws4ngO=9LeE3YvFkiv=KDgYupWxS6VePjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO8MXQwDh2Bvws4ngO=9LeE3YvFkiv=KDgYupWxS6VePjw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a876411 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fcjlUs8CjMbDbz1g4Y0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MyBTYWx0ZWRfXwYLRwfJVSgXN
 T89izoIasT0Bk1+MjqW7Bx8gQmxj3NV4mDx46N6bDvBUfvJRN+T8emFn7JcFwDyQ59WOw+qO/5g
 bEhOzqCMwiODq8ckh1zdMqRzl1AbUAMgISt6r0Ba9PxvDnNM7H1P3yey3n0YYO/Nw8XRafZHV5a
 wH2hZYFPKvnBcWBVWZ99hp+hipDaNS3no4fODgFTiW9XEGk9kCiSdhbba/XHOavy8muAVxxDHaZ
 ROWVEOlyHRX1uDnHnBL0jIBT7/PGXozbJhODyc4tOAurTeUYfz1vTYqn6kc8UC9LEbaL7uFpwdI
 J4wB+Ft3Rmbaa5m3iHh339wLVwE8AGUXSrnziIQpOi+rs+WaiIfN4TxVvIrkFvhm3ScRyR/UaAJ
 ORPjGcfEOlxgvEPOhj/WaoZ6x9vNacz1z2OuS6nskWc0LXkcIIK9Km58MdoAmABTU2TiHTr50S1
 j6QgJ74/WNB2WTLKXxQ==
X-Proofpoint-GUID: vLZT-EYagkDH4svALEccmHac3buP7uB8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MyBTYWx0ZWRfX6EapB0HXKstI
 crusRRUivYLxhQnDB2Awy7BE8HJZe/e8WP9+JdhMHMrPFCo1VudVKydnl9JvmwYNzlzfwsBZ7X4
 WaxmXN2MkYDfclvjUxxPTjnIb9k2qvg=
X-Proofpoint-ORIG-GUID: vLZT-EYagkDH4svALEccmHac3buP7uB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_133115_156828_77C90702 
X-CRM114-Status: GOOD (  45.51  )
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

On 26-08-20 11:56:40, Ulf Hansson wrote:
> On Wed, Aug 19, 2026 at 7:40 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-08-19 17:14:52, Ulf Hansson wrote:
> > > From: Ulf Hansson <ulfh@kernel.org>
> > >
> > > It's not always possible for a genpd provider to know the initial status
> > > for its corresponding PM domain(s). To register the PM domain in a safe
> > > state, the genpd provider driver may therefore have to initialize the
> > > genpd's status to be powered off, as a way to prevent the PM domain from
> > > being used when it actually could be powered off.
> > >
> > > In these cases we may end up to power on a PM domain through the genpd
> > > subsystem, while from the HW point of view it may already be powered on.
> > > Under these circumstances, it may also be required to keep the PM domain
> > > powered on until all the consumer devices have been probed. In other words,
> > > until the ->sync_state() callback for the genpd provider in question have
> > > been called.
> > >
> > > To support this behaviour for a genpd provider, let's introduce a new genpd
> > > configuration, GENPD_FLAG_OFF_STAY_ON.
> > >
> > > Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > > Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> > > Signed-off-by: Ulf Hansson <ulfh@kernel.org>
> > > ---
> > >  drivers/pmdomain/core.c   | 6 +++++-
> > >  include/linux/pm_domain.h | 9 +++++++++
> > >  2 files changed, 14 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > > index 7345c06f1d55..be4fff2f4664 100644
> > > --- a/drivers/pmdomain/core.c
> > > +++ b/drivers/pmdomain/core.c
> > > @@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
> > >  #define genpd_is_dev_name_fw(genpd)  (genpd->flags & GENPD_FLAG_DEV_NAME_FW)
> > >  #define genpd_is_no_sync_state(genpd)        (genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
> > >  #define genpd_is_no_stay_on(genpd)   (genpd->flags & GENPD_FLAG_NO_STAY_ON)
> > > +#define genpd_is_off_stay_on(genpd)  (genpd->flags & GENPD_FLAG_OFF_STAY_ON)
> >
> > Maybe genpd_is_state_unknown ?
> >
> > >
> > >  static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
> > >               const struct generic_pm_domain *genpd)
> > > @@ -2445,7 +2446,10 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
> > >  #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
> > >  static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
> > >  {
> > > -     genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
> > > +     if (genpd_is_off_stay_on(genpd))
> > > +             genpd->stay_on = is_off;
> > > +     else
> > > +             genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
> > >  }
> > >  #else
> > >  static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
> > > diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> > > index f925614aebdb..9929347e1d7f 100644
> > > --- a/include/linux/pm_domain.h
> > > +++ b/include/linux/pm_domain.h
> > > @@ -121,6 +121,14 @@ struct dev_pm_domain_list {
> > >   *                           powered-off until the ->sync_state() callback is
> > >   *                           invoked. This flag informs genpd to allow a
> > >   *                           power-off without waiting for ->sync_state().
> > > + *
> > > + * GENPD_FLAG_OFF_STAY_ON:   Use this flag to inform genpd that its initial
> > > + *                           status for the PM domain is set to powered off,
> > > + *                           which may not correctly reflect the state of the
> > > + *                           HW, as it's unknown. If the PM domain becomes
> > > + *                           powered on during boot, genpd will prevent it
> > > + *                           from being powered off until the ->sync_state
> > > + *                           callback is invoked for it.
> >
> > Maybe GENPD_FLAG_STATE_UNKNOWN ?
> 
> Hmm, I understand your idea to clarify this and it sounds reasonable to me.
> 
> However, "STATE" sounds a bit vague, what do you think of
> "GENPD_FLAG_POWER_UNKNOWN"?

I guess that could work too. I was suggesting "STATE" because the
gpd_status holds STATE_ON and STATE_OFF. So it would be the flag that
says the state is unknown.

> 
> >
> > Or probably it would be better to just add a new state to the gpd_status
> > enum, like GENPD_STATE_UNKNOWN.
> 
> Well, the problem with that is how it should be treated by genpd
> internals, when there are child/parent domains. Having an in-between
> status sounds unnecessarily complicated to me, at least for the
> purpose of $subject patch.

As for it being unnecesarily complicated, it would actually be the
true description of such PD. Otherwise we might end up with cases
where it is inconsistent with the actual hardware state.

But I agree, it isn't something that should be part of this patch.

Either way, I think the patch looks good:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

