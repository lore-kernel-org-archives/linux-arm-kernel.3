Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4E0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=aEjoo0XAF6Vz8pS0/1VvmjN/qw
	gm53Xtoxrs24VOkWbuQz6ESfeEPCqwnSbAWl4M/tfDS/LmxqiDl5ZpCXNI/n1FBbHlaHHVI+QTa0s
	KCTyaSs6/JVy/pOSOgLMc8yvdRQ5YMDNnj7URDF8KEdmS1fb3ca3ubkRADZPgYWEhExjVbT0345DE
	VXL3CXZKEMcNQVYpVyrTL6LNStxS87H84RSV4Y3g/SsnRCqjrRWBGj8lfcqpsQhBx8UV/tKEj/42L
	MYv9OHJMpmNqPs1NL5eaRfFeRoEfhQqXxxbiNlMfirSXovnrYFrLgyuMwHEvEWDIoevcX7BBwRtFo
	O1DdC+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu67r-00000001nRs-1ilY;
	Mon, 17 Mar 2025 08:47:11 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu62L-00000001mXm-0vKv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 08:41:31 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id C56E4A3B76; Mon, 17 Mar 2025 09:41:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1742200883; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=hatci1VNMrC4zcBMIFK1x/lAmifRw10mHkG+n0jO5lC+yexSI0f5hQUscgi67BNt9
	 FiXKKSn7vPb1i+nn++hIICTrXwsBUpxDXbh5Wi9velhMII5Y90kFVrUbvXvd5cqnmy
	 xwwaUO7uyAO35qKXSDib3zcc7U4EM1eNCi/7SzNqT8DA7abaiKo7g+uf9yvnsMMGya
	 wgg7Kld7N5T7I0gIM7rqomGOLeJpeXyiaOBa+S4l6JojRFt0cXTRPbxXxFrWWnfxDH
	 4KoTGRu6fol+yYakVCs17CzydKH22qJvehD6tn8+1GacOud5EQMWJbD5PdlIX8rSCU
	 4sKmVkt6C3ZEg==
Received: by mail.novaplan.pl for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 08:41:05 GMT
Message-ID: <20250317084500-0.1.kg.1gqnp.0.c6u3c02iwj@novaplan.pl>
Date: Mon, 17 Mar 2025 08:41:05 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_014129_949058_0CD2335A 
X-CRM114-Status: UNSURE (   2.31  )
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

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Z pozdrowieniami
Adrian Liszka

