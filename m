Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XQe2xFk4;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Aadq76Ib
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HYpokslgUmrlnfncU3L/zsbF0VduaADvTVTWpX9Ts5s=; b=XQe2xFk4d/GmkDedmGcr4VRDjS
	qp++sSuGBThm4ENxXR2YJvc83Xt5NUIJ7HE3WEdc5gwQu78l/kfQf0FUuj7om8npzuVvxT8B647GE
	1DnUmbGYLpHC5g+l0ObPbU5JeStlxZ8eDGtqV2wmWSqW/+Ti+Cgd8gav7NGjdFLJ4YBRE63aynhVO
	MXA4FIThVxbNAFdcV119Ea5g5iKxKCiGmF8o93SclpM9+Q7djJ62y5mF08FTUWFhXiJ5WB0vBj6uS
	APMgARerDOjA+qJhzEBR/7TFC/TPUeV06/tTwm6FvP/0amUx31YbJhZlGkL36SontVTcHx90byQ2O
	2SumGepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCEl-000000026uW-2FT7;
	Tue, 03 Nov 2026 10:59:31 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCEi-000000026rz-2rpC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:59:30 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 20042202806;
	Tue, 03 Nov 2026 11:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HYpokslgUmrlnfncU3L/zsbF0VduaADvTVTWpX9Ts5s=;
	b=Aadq76IbqcmCqFO3Xl3Zl7G6rHCjOEMcq3OCZqjWiNwHifsU01lYWQqJi7gtzgH7e7s01/
	X5GX06kUJvmBjz1sA8xrqJEmKfp7bXJmK8YBBSF3C7sO0xUViU9CJdLOUpkVgGT/8SKL/0
	lLKDFt7kswKOQGIrVzvUj5Ilik1RPpIftg30I+1FveeYJ6TkNjQNM1P2+IfuCsKdhsZxsU
	dZ8f7pEiLT1nTCagZIqaMsIaagznoisklxvltLH8FW2sWMHaOUXr5JFPEB3X/BPtxnTPBH
	5nFYbVvqdjNJkjdqwLfj/vOK5s9islXy1RWKhe6HLLIjTE4fy/Jwiwj3n6iNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HYpokslgUmrlnfncU3L/zsbF0VduaADvTVTWpX9Ts5s=;
	b=CrT3xe6idt+GQHJkdGerOBD7jKAzLMWyQ09TK64Va6/Uks2azMFw29nkPPMh+FhKT2BZo9
	7rG2v4FJZC7p8pgUkf5dprY2QGcLc0470gF/gyjUaq3iS1CR9cu5ftolz38ecZtRH23+zf
	UCqT7xP8a39I4Z0ESqHOhkW7p8sJPhgE2NUXIhZkqaGoa3T7mqfSRKYi3lq+tpS/tDxZCH
	/4PHm0y+zCS7Ur1JKYLWX+GmIOmADr44lgneKlzeEW+KqVXiTL2jImDVAqZkMyJnkF7dU/
	zl6XWDKddDsxpu0LvIHQ4xfWB3/F1QxFCho18qbki+GFAsYdGrKodC4zF+GcRQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793703567; a=rsa-sha256;
	cv=none;
	b=Rc4ElyTcHQHzzCa23Y4ZZFf0kHWk9XxEJxDqMzfdnAjMQp7SgdRKfBnO9eleQC6TGlkro8
	SQnOxY8HrlYUDcHu4JgCBM4InflRXupFPE5rF8a6ZCcipmF0qviNPe4eZyDHYwU5xOBnx6
	J4coPZI4vC6vyUBdm+xR8lnvfECW3rcZoesUogbInFxarxn/4mV3tMTyIi8rTnIBUUqwS8
	81thafDukchckSBiQsYTGty77NuX9Q2aD4TD1zZR5AGV6BP9dUxO8X7FkYI3hL92lCROWi
	D2E+pv+qM2E+2oG3kryrnmgGhwTeJd5s1/j2k7ZXNV1pv8S05o3+QBmFf4ZSwg==
Message-ID: <0525fec32cd3c35768585c57bcfbc4a7bb2a569d.camel@pengutronix.de>
Subject: Re: [PATCH] reset: scmi: Set the device for the reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Sudeep Holla
	 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 11:59:27 +0100
In-Reply-To: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
References: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025928_879053_E8888FBC 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fr, 2026-10-02 at 17:41 +0900, Kunihiko Hayashi wrote:
> SCMI reset driver does not set rcdev.dev when registering its reset
> controller.
>=20
> If rcdev.of_node is not available, the reset core tries to obtain
> the firmware node from rcdev.dev. However, rcdev.dev is also NULL,
> causing a NULL pointer dereference.
>=20
> [...]

Applied to reset/fixes, thanks!

[1/1] reset: scmi: Set the device for the reset controller
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3De3e068a457ce

regards
Philipp

