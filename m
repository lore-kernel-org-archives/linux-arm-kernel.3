Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54440E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=OvOgym2jLP3EAUjEEejpa7E29K
	1l7r1xjuv4rBlTumYFlbIM5Kifd960qDuNQy1ogn8MrBGe3W09bc7MpfBRrJoRBP7OFXdKwDLtGZq
	zysVRMyJWdAm+gnTi4R9hsvAP4KnvV67y8Y21pleewgZm8SwUpmTtNKQff79wCI2d+fmhA8W+2vGJ
	pu1HB/Fvu1yKmkDXi38aImQkGB7McjbNFhaGzKL5G90Jl28F4qS2Z111EGyAOVBYhC+xUevTpIWsh
	JFC7WM0qAiDV9S0rDqBgxfsQcMqx5ggqxHzMh6ZqVETzjbU+JJglYIP/bngoLf3atedQ5sHdLQ5O5
	aWkjPEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN72K-00000009UZq-302i;
	Mon, 16 Dec 2024 09:05:08 +0000
Received: from mail.analyticsservices.pl ([217.61.0.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6zW-00000009TzS-40Bl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:02:16 +0000
Received: by mail.analyticsservices.pl (Postfix, from userid 1002)
	id E686D84056; Mon, 16 Dec 2024 10:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=analyticsservices.pl;
	s=mail; t=1734339708;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=HHnqkOHCivohLCR/XPe+Ak6nUuhbAGRam4Ru1+enP18FeWROog9pw+sL75t30/FXX
	 CVOuCjqKrAS6SBz/SFXHd40FuA/2y8K56WAXKmXZ5MD/+D9u/AsPja071FQnFhMAz8
	 5RDgK3x5kW8vnAkab0WQsAMGxVYQ9YTiVfbJtpspN7POkjcsdRJ/hfUitEOFTSPKAd
	 rV3GfHTI/1YpjU5V/9PmhOuuipttxvDm4G8G5mZSoOby8elRZXvd9wRJ4HMQvgzCsI
	 EvhW1FX3ErS9tNEjIO4eZ9t+vMRYnydB4b4eOqc3ZFRhtwvBJw9toMh+t++2Xnb1B7
	 g5nyUeI3dS2DA==
Received: by mail.analyticsservices.pl for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:01:01 GMT
Message-ID: <20241216084501-0.1.i.3o3y.0.elqawmhfo0@analyticsservices.pl>
Date: Mon, 16 Dec 2024 09:01:01 GMT
From: "Patryk Wysocki" <patryk.wysocki@analyticsservices.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.analyticsservices.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_010215_135775_6A621AED 
X-CRM114-Status: UNSURE (   2.51  )
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

Dzie=C5=84 dobry,

Pozwoli=C5=82em sobie na kontakt, poniewa=C5=BC jestem zainteresowany wer=
yfikacj=C4=85 mo=C5=BCliwo=C5=9Bci nawi=C4=85zania wsp=C3=B3=C5=82pracy.

Wspieramy firmy w pozyskiwaniu nowych klient=C3=B3w biznesowych.

Czy mo=C5=BCemy porozmawia=C4=87 w celu przedstawienia szczeg=C3=B3=C5=82=
owych informacji?=20


Pozdrawiam
Patryk Wysocki

