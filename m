Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D54D11190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8kQKguoYc6YaV0+ma0j4/JnkDhYuMlFzZYjS37l3/eM=; b=bC7Du9Jb2RqgBxU41RFRpToo/S
	TCIbowjdlMCcBeolrOTFU9AcKr13UU7qseyGodViZAhnxMelYZYZxvtvHvFfu6R65b05BQgVzetQN
	7LzRynU+M1XoFpbhR+W+NccOQS5PPxQsSatwGsk8uNstx64gHhTvfdiH564Tlr1Js3t6tmShU8fr8
	uKIrJkBN6Gi2LvwbKEgqe26u1ukZ+O6x6qgQbY+vscu42NmUCmt/OXWz4nehYh5JCDdjvx0REcsOR
	AA0RwxZdQjdT5JQCWq+tnQWmzszuf9pXlEBWjfb7NCKPkq0/8ieC+1Rjmc28iBNiPgaoc2bGKgUzB
	n8DUFXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hg3-0000000C1iY-10jA;
	Sun, 03 Nov 2024 20:58:27 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7heN-0000000C1aj-0TmG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 20:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8kQKguoYc6YaV0+ma0j4/JnkDhYuMlFzZYjS37l3/eM=; b=vbyVSakxgCMiX2gHDyPzqawSFy
	rzupMVjXbQaamCe0/sRJ7pIKTv4kWkW35feyJemG0C9r1WpSncJo4PcwXvpovbz75EruZKRBNX22X
	He9DTiwMhKqrXynFVl0oD1QO6XD9NopfXG8WpN6rJSTln/WIVu6FuQv8FyCnWJnKT9vrvlOEForLV
	Po+Q7XxXYwulK23c/lHKWWkebSCHAmoitB30b18obiM7GZ66CPtg91tdylHlD76YHf172bDFGYddF
	Tt7Nzy5JHOL/C0+c6qx5tb4DkHFVjsNuq+7YciikssTe8ScUwTy2uUIXTVCK2fyMjwTT+DlwIRaAE
	P3+VkhAw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <rouca@debian.org>)
	id 1t7heI-00BjKS-4k; Sun, 03 Nov 2024 20:56:38 +0000
From: Bastien =?ISO-8859-1?Q?Roucari=E8s?= <rouca@debian.org>
To: linux-arm-kernel@lists.infradead.org
Subject: add 32 bit equivalents of 64 bit hwcaps where the feature is actually
 accessible from 32 bits
Date: Sun, 03 Nov 2024 20:56:37 +0000
Message-ID: <5837608.pJAOddS3HE@portable-bastien>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3786897.Sz5cDXFhHV";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Debian-User: rouca
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_125643_193333_BD177746 
X-CRM114-Status: UNSURE (   6.24  )
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

--nextPart3786897.Sz5cDXFhHV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Bastien =?ISO-8859-1?Q?Roucari=E8s?= <rouca@debian.org>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 03 Nov 2024 20:56:20 +0000
Message-ID: <5837608.pJAOddS3HE@portable-bastien>
MIME-Version: 1.0

Hi,

During code review under debian and how to improve the code base we found that hwcap between 32bits and 64bits are not in sync.

The underlying request is to add 32 bit equivalents of 64 bit caps where the feature is actually accessible from 32 bits and make sense
(not all hwcaps make sense)

the second wave of crypto instructions (sha3, sha512) was not added to arm32 for instance

Rouca for debian project
--nextPart3786897.Sz5cDXFhHV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEXQGHuUCiRbrXsPVqADoaLapBCF8FAmcn43QACgkQADoaLapB
CF/fYw//d7crhWG05jfDUP3I/61ZC4b99KnY9DWln3MTj9onn/rwy0XO+6YMc6lq
3yafmY8K1f21Q6A0gIQCbkzfnNsCxJDUog6K4rEtOP0+ibiO9fkhzZaG4OHAkpve
acD03qqqVtSoW9UZMkzL2GIpM5u/xDjssNrxhsrdOkyKhsRePaClVVkxMVYDaZk4
faTVojvp2F1kNefHPmJCzfrVeFo9r1YCHP/g25KBq4a2t2oTxdsmKI00KbOW0aBq
wY8UpXGQIpqPJi7EBjzFk7oHQV59yKq16CaZIFCDeOnKBccPD9N/lHLSwHx1dr4J
wmVu0bsUUoFGraPnhilpHq6yeo2EyDxs0eycwSh86Abiro/A2tnrSd1q48nd/KDy
SzXBqjQLfvsKC0edmr80lwxgScJgeCHwiUVNcQzUDtUHih0BUCFZf3PTX3Ejl1jL
KCrEfUEqWp9HvM02szg95LJOr/E2u2ivfR6J7wyB8VW1C7ZWLkTQNytJ1vz6KQ5K
sdjAGrPT/8OL2xO4Y80hkCfa2YCApxsRfPeh/wAo90Y5gZE0ANC6HoOgDgXIauzm
D1+1ql0DV7lHdmYIkRwsMr7SbYcjX/7aQpZcjOkb9qZcjt5sBy05HDNPVXkILn7c
3E+hkqJiiN5sF0R75ZER3gxpTi7OeRDD3EwNZ1SpzmUSITaiOow=
=kZkZ
-----END PGP SIGNATURE-----

--nextPart3786897.Sz5cDXFhHV--


