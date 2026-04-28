Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EC1FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j17uIs2uSTZoslQO8sNkyZKLiUN4S6LiyldQE9M8uqs=; b=1MsxH78C5+VzxTtsVa8WAmgLCg
	TBNthmGqZXLN1S1tikSDMDd+5jWBHeeItmgJUXG72ixtG3mw5eq6DIJtf5XvUyDWAc+uMUf68KFgI
	ZRuCrX7mXo/VUWa+7hiHtv770eR8Z8QC7osjqUAiWUXo1JwlaUUFqh+MK7WArc5uSajrOoiXM23iY
	PekIKaZ2jdZkCF4btf00oE1by7ZrefvHO1pcG9lmLiSh2la36S9uIuZod1pTqY8Nspb8NtWR7oFJc
	ruvEmApTz+gk9ns90ZMb6Jp2c84192oJDjo1Rd/9I52QccstEtWKWUD15NzaAPlqzi2MOxo83hZ+Y
	Rkruz7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlgZ-00000001yz3-2yQ8;
	Tue, 28 Apr 2026 16:53:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlgW-00000001yyf-1nEV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:53:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7223B1A3470;
	Tue, 28 Apr 2026 16:53:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42E2E601D0;
	Tue, 28 Apr 2026 16:53:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52D6E10728FB4;
	Tue, 28 Apr 2026 18:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777395195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j17uIs2uSTZoslQO8sNkyZKLiUN4S6LiyldQE9M8uqs=;
	b=jn0ofNKcSjS7aBuwPqSIA3GjilSnM1Fi4lLPm8K+6s/MikfEa64Epqh/fLM3NM/EGa+YzE
	uUQyJ44k/mSph8gkWDq4lO+dxb5/SSMuygUIm/v3n6KasZIdEDf1Q7sKge4xjpVS3M2Qn1
	UjWkDO9jPkiDz1eWlFfahzgbTmjV81PtWp7XCBCzoqxjCDAxADj+YIJzq3P3F31VCwmIVY
	kg3b6/esSGyuwalMf5VoXc3w9CTLN+lzxEtByTbiyRGUco52qvTeS06DSCTdtAEB+mrTzj
	/ZuZ8ub1uiGmMMeQ/XfKamK2BByabe5ndrQs6qWN4Di4EFWIwTNGjB9YhYYP6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 18:53:05 +0200
Message-Id: <DI4Y0BT5TYCP.25I7SGJ3L223L@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
To: "Biju Das" <biju.das.jz@bp.renesas.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "laurent.pinchart"
 <laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Xinliang Liu" <xinliang.liu@linaro.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, "Yongqin Liu"
 <yongqin.liu@linaro.org>, "John Stultz" <jstultz@google.com>,
 "tomi.valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
X-Mailer: aerc 0.20.1
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com> <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-10-a537b5567add@bootlin.com> <TY3PR01MB113469B7764079DD361E3FE8D86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113469B7764079DD361E3FE8D86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_095320_601668_9F6CD7E6 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Tue Apr 28, 2026 at 5:37 PM CEST, Biju Das wrote:
>> @@ -2461,10 +2459,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>>  	 * Acquire the next bridge in the chain. Ignore errors caused by port@=
5
>>  	 * not being connected for backward-compatibility with older DTs.
>>  	 */
>> -	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
>> -					  &dp->next_bridge);
>> -	if (ret < 0 && ret !=3D -ENODEV)
>> -		goto err_reset;
>> +	dp->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dp->dev->of_n=
ode, 5, 0);
>> +	if (IS_ERR(dp->bridge.next_bridge)) {
>> +		if (PTR_ERR(dp->bridge.next_bridge) =3D=3D -ENODEV) {
>> +			dp->bridge.next_bridge;
>
>
> A warning on this patch
>
> drivers/gpu/drm/xlnx/zynqmp_dp.c: In function =E2=80=98zynqmp_dp_probe=E2=
=80=99:
> drivers/gpu/drm/xlnx/zynqmp_dp.c:2465:35: warning: statement with no effe=
ct [-Wunused-value]
>  2465 |                         dp->bridge.next_bridge;
>       |                         ~~~~~~~~~~^~~~~~~~~~~~

Ouch. Guess I should have pondered a bit longer before sending, will do
before v4...

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

