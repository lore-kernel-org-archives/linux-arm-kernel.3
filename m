Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279E8CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wlapFSWGO6DNer+Ht2N3RKQcuhgJMsXd2Wu+AmSoUk=; b=lC2udOMjc6x4hmFazOCFbjHPYu
	qn70GssHLGF2OXSbqPQpvrx/+RcH8vZ4N44uMQBUyN0rvx9vmJ1ypxyqMEZ2tJgX/ifOKkdSqeRMl
	WFLmLDRC0j8cPZR48nB8viXDtavMiWE6JIkqDsJXipvZMqzVlhfrvI2QngyUSHds2E0WKc752r7Ds
	LVZKpmxNVfKt01pvADNrjCPF+yNNPjgidAgy5DiGCQHuaBU6GutOzDhx674jA1DcoQsKP6yEttSfG
	IBC8rg9Vv0nM5WNm4dnMFO64EQCDMvqYDWOVfEjoSXwfm3lXXb0qYVvJHvMNstw0HYi2Hhr+CK0NE
	j/RbmlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPhQ-000000081CE-2qQs;
	Wed, 24 Jun 2026 15:39:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPhM-000000081BN-3LWz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:39:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B7574E407D5;
	Wed, 24 Jun 2026 15:39:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C776B601C5;
	Wed, 24 Jun 2026 15:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B65AB106C83D2;
	Wed, 24 Jun 2026 17:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782315568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7wlapFSWGO6DNer+Ht2N3RKQcuhgJMsXd2Wu+AmSoUk=;
	b=R2tbTHoHg6xp8JHCk54cyMomtr3bBIbZWDSp+cCHNJ9OtWW9AnRTIPAEs/OcMPdUKK5JsB
	k1kNCA8XHXGluZErZz0oiODLWi6Rjj6JmeMb5WlzQLrDI33rqMd7/NTArt1Hx8h+/8SDyb
	4wcxhbwXNOGXUr2zV6+Pid3E9PaXrfYhfy5rSCzSwOfqGX1klzu5jp9oZy6sr19dEeTcCt
	q9vMmT/B2ERe48YTHNtQEThtcTQaOnh0NHReQpRz7CDPJ9TH8CQiyLEdBvtOPQ6KBgoS/d
	2EpjsuTaGx+EfvHQQHy/zY8pEP3SfIHLt38I9JcBfnfOydt3GUe0TJtqZwm3Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 17:39:19 +0200
Message-Id: <DJHE4WR3TVF2.21M3201WSTC9O@bootlin.com>
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
 <20260608-little-lyrebird-of-competition-c25f7d@houat>
 <DJ736L2DR8H8.35296DRNZ1OW@bootlin.com>
 <20260624-chicken-of-infinite-enthusiasm-8b0e3f@houat>
In-Reply-To: <20260624-chicken-of-infinite-enthusiasm-8b0e3f@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_083932_977011_AA21F733 
X-CRM114-Status: GOOD (  17.93  )
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

On Wed Jun 24, 2026 at 1:47 PM CEST, Maxime Ripard wrote:
> On Fri, Jun 12, 2026 at 02:57:39PM +0200, Luca Ceresoli wrote:
>> On Mon Jun 8, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
>> > On Tue, May 19, 2026 at 12:37:23PM +0200, Luca Ceresoli wrote:
>> >> Currently drm_bridge_connector_init() always returns the added connec=
tor or
>> >> errors out. When adding bridge hotplug the bridge-connector can be
>> >> successfully initialized without creating a connector, which can be a=
dded
>> >> later when the pipeline will be complete.
>> >>
>> >> For this the internal function drm_bridge_connector_add_connector() m=
ust be
>> >> able to return a valid drm_bridge_connector even without any drm_conn=
ector.
>> >>
>> >> In preparation to support bridge hotplug, change its return value to =
be the
>> >> same drm_bridge_connector pointer it gets as input, or a PTR_ERR.
>> >>
>> >> No functional changes, just changing an internal API.
>> >>
>> >> Note the return value could now become an int (0 or negative error) b=
ecause
>> >> returning the same value received as input does not carry any added
>> >> value. However this would be change a lot of lines, so leave such cha=
nge as
>> >> a future cleanup.
>> >
>> > You just created that function and changed "a lot of lines" already, s=
o
>> > I'm not sure that argument holds.
>>
>> Do you refer to the previous patch?
>>
>> My comment is more about the following patches. It means I separated
>> changes moving code to a subfunction from changes to the the return valu=
e
>> in separate patches, so that each patch is trivial to review for
>> correctness.
>>
>> Makes sense?
>
> What confused me is that I took it as "I'm not going to do that work
> (yet?)". If you do it later on, I'd drop the "future cleanup" part, or
> rephrase it.

Ah, I see the issue. I really meant "this change [returning int] is done in
a following commit".

I guess I'll just drop the whole paragraph.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

