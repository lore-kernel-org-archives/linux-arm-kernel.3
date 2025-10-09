Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A07CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6pc+5/xPhSbH0zr9bjAiMmMFYb2K/+gFLzIJwDWd9Q=; b=WKf4iW1Heiq9hCHNbIRTpJK+3z
	REykhK6jawHSGZdj9sK8tL+Wiw14swIs1AuResKBTFRzgc/KwdMLbHBrxcDAMkfI4tRskFLynm3+7
	WlLsIq3ljDkxJoc3bRCBmEShphYro+Ny4Dj66feH0vss/oC6SA8LzYqoHJ1NARTMoWK5ytXFR1Uth
	+jLNq0m0fAI6E8WeLhLyh9lUjs0mKNlLgd7eMntzNID7e+WGZDbxzd71ADr4sWdLbTzS3hNYKajXs
	a+IVst3loNOE6Dy/Zo5PJLHQ8iAm0S3RUT/JrzgS4CkEA27Y5vZmlJsczFMxBMFttI2qIBQGiW8er
	fQIBrtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lmG-00000005TkS-3suO;
	Thu, 09 Oct 2025 08:13:32 +0000
Received: from mail.primefinix.com ([141.95.160.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lmE-00000005Tja-2vPa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:13:31 +0000
Received: by mail.primefinix.com (Postfix, from userid 1002)
	id E43D1A7745; Thu,  9 Oct 2025 10:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=primefinix.com;
	s=mail; t=1759996986;
	bh=W6pc+5/xPhSbH0zr9bjAiMmMFYb2K/+gFLzIJwDWd9Q=;
	h=Date:From:To:Subject:From;
	b=eW2yRotgUu6PTSWKFBVJppXzG0OinGFRi4Bbo4EOWEEnrNBQ230/dKL2WKJrfa66J
	 uFYITGNKK9djMoX32K7wffFGsJutdFHoJqCQ1r49TlahrMMe/sOBIaGTNn5Ur1OypA
	 B3DXDVNqqByCuG8mVsN4hw9aCTCO3OuP0/ayxphNSqLQjzAgCUh7oqUbvGm9WMLX8G
	 fPNqkv/30OeDFBF9sKz0ULiVLBMjKuTugYkEV3Zdt3K/z0uxbXTafPTLwCq4j2Qvim
	 2s++jTjum25BHdtxCZFFVh5+fS1PRBz8jwF+DLRD9LwrqDHTkSv6IUDfby0a3+HY9q
	 lUvm7HLXhApwQ==
Received: by mail.primefinix.com for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 08:01:02 GMT
Message-ID: <20251009084500-0.1.ng.47mzr.0.1wxonrkjdc@primefinix.com>
Date: Thu,  9 Oct 2025 08:01:02 GMT
From: "Brendon Roy" <brendon.roy@primefinix.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: No stock, no hassle
X-Mailer: mail.primefinix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_011330_884832_71BE02E4 
X-CRM114-Status: UNSURE (   4.38  )
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

Hi,

I know you're probably bombarded with offers every day, so I'll get strai=
ght to the point =E2=80=93 we have mattresses that are selling very well,=
 so we're offering collaboration.

We're looking for partners to work with us in a dropshipping model =E2=80=
=93 no warehousing, no logistics, and customers receive their shipments d=
irectly from us. You focus solely on sales and margins.

Does this sound interesting to you?


Best regards
Brendon Roy

