Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA02EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LH+iUqYtsx9Q82Z/A/STz5utvD5WN0xWdlYg3A9mk3s=; b=xIctromQAFX3Rn
	Ih5mwcWj/mNwNs77JuHH72QREBsPnvfZX8sCN9sDxCHD7Nmvbu96R63x5eNxgkIOSaB/kSXucmLc1
	isXepiyZT4UXAYolQqwcJb3jrw/VV1+dN41kH+xdQOtIxHQBuxzK+axiXCSB+2OacvkNKhr2NVEVZ
	hpQawkcKGmlVfSVeVaqpGi6vy6xwZAl/OE4KjhWcdzK2/rxi1ONzuCC1B8fOzeEQbUWge2t8gEpRP
	sEOgz+rS0QfhMvqyVmNoEfiPIr3dFRxrNujfv5gCsGUqIsFn4bG8KRaAiQqair07kVqdlmAcRWRfJ
	bE+uP5EHLZ48to95967g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52Wf-0000000Gx8n-2Bob;
	Fri, 11 Sep 2026 14:46:49 +0000
Received: from pmg.cloudtechsas.com ([142.44.173.162])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52Wc-0000000Gx7z-1QAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:46:48 +0000
Authentication-Results: pmg.cloudtechsas.com;
	dkim=temperror header.d=medisfarma.com.co header.i=@medisfarma.com.co header.a=rsa-sha256 header.s=cloudtech header.b=XTEx8fTF;
	dkim-atps=neutral
Received: from pmg.cloudtech.net.co (localhost.localdomain [127.0.0.1])
	by pmg.cloudtechsas.com (Proxmox) with ESMTP id 218C133FB6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:38:13 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	medisfarma.com.co; h=cc:content-transfer-encoding:content-type
	:content-type:date:from:from:message-id:mime-version:reply-to
	:reply-to:subject:subject:to:to; s=cloudtech; bh=LH+iUqYtsx9Q82Z
	/A/STz5utvD5WN0xWdlYg3A9mk3s=; b=XTEx8fTFPrHPelYfiZVTR2R6bvcFN+8
	KQDG5VUAFfmJx2/cTsBMXK18hycTVcLQFwROgdTYGcm7hmVz/np8qsF0GWyNkkrW
	h0UcDaKpsq0w4ogXRCTcWg+kGvF+axOwZ2pdxDCtMkdGWatVYgLL3PUSZ4VcEEyC
	+N4LI5tUFHqM=
X-Virus-Scanned: amavis at medisfarma.com.co
From: "Euro Millions" <asistentegerencia2@medisfarma.com.co>
To: linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?B?R2zDvGNrd3Vuc2No?=
Date: 11 Sep 2026 15:38:09 +0100
Message-ID: <20260911153809.861F3654CF29BBA7@medisfarma.com.co>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_074646_442948_C3A17DDC 
X-CRM114-Status: UNSURE (   1.62  )
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
Reply-To: emailnet@mail2webmaster.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Herzlichen Gl=C3=BCckwunsch, Sie haben =E2=82=AC650.000,00 bei den monatlic=
hen=20
Gewinnspielen von Euro Millions/Google Promo am 1.September 2026=20
gewonnen.

Bitte geben Sie die folgenden Informationen ein, damit Ihr=20
Gewinnbetrag an Sie =C3=BCberwiesen werden kann.

Vollst=C3=A4ndiger Name:
Heimatadresse:
Geschlecht:
Alter:
Telefon:

John Andrew
Online-Koordinator


