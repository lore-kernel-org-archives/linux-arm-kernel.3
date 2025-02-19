Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8070CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=rm16Mo9bSEdxpJWhFWPV7SpeqD
	x4s/aPE/bRZWm6UzBcR1OWIfryWuIB0JWPP9cUWAegjEdjXinbI4iB2Gr5vVy0wdDA09AaEYQ/N0Y
	LD7YMbnadEGmCkgdA3fCxTsIDJ7vL/2NccaVEKJDy0SA811kuMIubuqpwCzpTTWQ0723i/EKMdITS
	lUZgtIa832hg0N/JgtfflLUW9S9SQMYRO/xaPv8yc9h0KfOQMxAcGeyFyfrjGbPtoMLvgY6Thtjw4
	mKbQi96kL53ehp41BGYZuw8eEHbIVAanOWucBVxCm2gR6Mj9uIWbxTehPTVpPdzI36CHJl5vguSHm
	PTcOAaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgLz-0000000BqdQ-3QZT;
	Wed, 19 Feb 2025 09:26:51 +0000
Received: from mail.corporix.pl ([151.80.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkg8M-0000000BlO0-2gyb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:12:47 +0000
Received: by mail.corporix.pl (Postfix, from userid 1002)
	id 0A5752458D; Wed, 19 Feb 2025 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporix.pl; s=mail;
	t=1739956024; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=FTV7vCiTh7WpU3JeCP6D5j4eSimWvxj4ojMripJ7mhYkGT3aCL3gn6fuNX2EatBOW
	 FFyOOGOUhOh3KX2lWJOLah6Ecx+u2/XGbVXeDCvKIxuhhsUY9kxqiuiIkCVrEKh9OU
	 27uaHwo7LW/GeNOL9essrCLuFHFc2qBi6RlkxyFOGj7E2YMkztJhjqCnNKYhQP8dlk
	 uz2DNmQ76B9tJHr2SB/d2I0Jg8Gziq+Z2M+gu0BM2ETe630VJlSYQu5mj3qi/JGZI3
	 gUVt6nUe4ym6mf8gh0q8BOVxZiHoLF/38CHVo3iFxeKlZ8dP9uff+LVGkJCBFus9g7
	 GvTgZpUpei3eg==
Received: by mail.corporix.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 09:06:02 GMT
Message-ID: <20250219074500-0.1.h.4egq.0.lj84ijjjup@corporix.pl>
Date: Wed, 19 Feb 2025 09:06:02 GMT
From: "Patryk Wysocki" <patryk.wysocki@corporix.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.corporix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_011246_823649_5E2B1D56 
X-CRM114-Status: UNSURE (   3.05  )
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

