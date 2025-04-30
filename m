Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 03:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/OQ4kOvTcNe5ngDnpuNyb1Rkf4c0mc6GjryUZ+CPbbU=; b=AE4LQZ0pHW+Kw4Mamd4/vl2sEK
	umMuT4haerQpxfJwi4EcGvy2+kzQqkfFXmJvxBpTXK6Omcl3oO5lyyn0kJWe+sIMaVjczitLeIo6N
	aLXOTdAbx7I5fZ4+B8wYK/dSIzbQqYS/VhAWUjznpuKg95gbl4IW6z147vi8m61C48mII6++0ZYuj
	OMT+j+hfKAmNtrn8LNADpQVCOroi8kCD8kG4tC1g+7ucfCCLEKoBgv2ibYMwha6yutt8UIRe1ZkDa
	AYvH9BTfH4OdTzD14f13ir6p5m396QU1/MrotS3iixgYTfZ50TegNL5gkUJp6qE1aEzZMhirUd/y4
	8OPF0oqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yKB-0000000BbgR-0Wbo;
	Wed, 30 Apr 2025 03:41:31 +0000
Received: from [23.94.54.125] (helo=airdropuniverse.estate)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yIH-0000000BbUS-1fx8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 03:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=soorchico.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=acc@soorchico.com;
 bh=/OQ4kOvTcNe5ngDnpuNyb1Rkf4c0mc6GjryUZ+CPbbU=;
 b=kxq11ZnrtDeSlWTdQ1qSaX21cbydq56LHe20Vfc62HPuwfqMX1lstLpHRfQKK8qf85RkwgcoUetS
   NpxkWhCa0vNTd4jhSqlM6B6LFpzyv6PHONxpBVMgBMsud7Tqayv4xZMk7Y2RZLFXkaB1B4UaGFAB
   n5GR8TVSUGVa9HjLyMc=
From: =?UTF-8?B?THVrYXMgTcO8bGxlcg==?= <acc@soorchico.com>
To: linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?B?Q29uZmlybSBDb3JyZWN0IEFjY291bnQgZm9yIFRvZGF54oCZcyBQYXltZW50?=
Date: 29 Apr 2025 20:19:15 -0700
Message-ID: <20250429201914.320F60D2CCBB3568@soorchico.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_203933_497195_8CDEF6C5 
X-CRM114-Status: UNSURE (   3.33  )
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

Dear linux-arm-kernel,

I=E2=80=99m Lukas M=C3=BCller, Purchasing Manager at HorizonTech GmbH, a=20=

technology solutions provider based in Munich, Germany. We=E2=80=99re set=
=20
to send a payment to your company today per our customer=E2=80=99s=20
directive, Schneider Industries. The issue is, we=E2=80=99ve been=20
provided with two different account details, and our outreach to=20
Schneider Industries for clarification hasn=E2=80=99t been returned yet.

Attached are the two account documents we received. Could you=20
please review them and confirm the correct one so we can proceed=20
without delay? If it=E2=80=99s easier, I=E2=80=99m available at +49 89 1234=
 5678=20
to sort this out directly.
=20
Thank you in advance for your prompt assistance!

Best regards,
Lukas M=C3=BCller
Purchasing Manager
HorizonTech GmbH
Bayerstra=C3=9Fe 15
80335 Munich, Germany
lukas.mueller@horizontech.de=20
(mailto:lukas.mueller@horizontech.de) | +49 89 1234 5678
www.horizontech.de=20=20


