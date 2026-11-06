Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FD606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDnXYtkB;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=sCZijAZD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YfbuL9NipT5CUX35p4YpXm85UJ/pLix7zAUVyhBYcLM=; b=hDnXYtkBctCk50
	zkXoel06eSWz7JA4qgIx423QbfQUFtxIsYnJ07vyodUwwhvMEYmuMqO9IKH/PbuPuKI/Se1FUuZKz
	t6HaxGYMe2jnf4E3SapjfRaZP3PhDYxLd+TpjM/f6eU4CkvVNilX3aHT99Ln8rVlITTtc27X+btjV
	PdV9FbmMLDGgxUhQCwutQFeENL5cI/v0fb6KwDXdgdeA36sAQ47CbH1/gZJsbUbAzcLE44pGUVm9K
	/XfcgViO+9v5mFv19fBRZIVlI0R4Jup7Oo8hMCnrxOmIfJ80C8gKLJ9AoRwXmGpQa/2PGoNdofiQ1
	1AoMnps8lesly8Mqmhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGRl-0000000BmmR-1q4k;
	Fri, 06 Nov 2026 09:41:21 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGRi-0000000BmjW-05al
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:41:20 +0000
Received: by chaosmail.tech (Postfix) id 5625C1CA444;
	Fri, 06 Nov 2026 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793958069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YfbuL9NipT5CUX35p4YpXm85UJ/pLix7zAUVyhBYcLM=;
	b=sCZijAZDd9/SGpPGFxtA64PrWjVAfOoTxQ+oP2NzEcuKFZxZbjRLYNDbBBGO/UByN4lGcs
	ZrIeVD9/xINk1sveibgB0JKkkw2WAtBDbMQ9DqRg9xYrhqNEKq7lv7MTEKWYof7a0SCug4
	Uri69wI3+2hA/uQrn2MgrKfT4f48X1Q=
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261106083339.677cc75d@kait2en-mbp15-1>
Date: Fri, 6 Nov 2026 10:40:58 +0100
Cc: Myria Sarvay <myrialsarvay@gmail.com>,
 marcel@holtmann.org,
 luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 sven@kernel.org,
 j@jannau.net,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Yossef Osman <Yossef.Osman@proton.me>,
 Aditya Garg <aditya.garg@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
 <20261105085750.120392-2-dev@deq.rocks> <au1uH6uxtsw2vHfP@macbookair>
 <20261106083339.677cc75d@kait2en-mbp15-1>
To: =?utf-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_014118_518290_E6B1A680 
X-CRM114-Status: UNSURE (   6.79  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Nov 6, 2026, at 08:33, Andr=C3=A9 Eikmeyer <dev@deq.rocks> wrote:
>=20
> I'll drop 1/2 and send the hci_bcm part on top of
> Sasha's patch once I've tested. Then we should have it nice and
> consistent.

You probably shouldn't, or at least base it on v2, not v3 (that one
ended up being a bad idea and caused firmware timeouts, so Asahi
downstream ships something more similar to v2).

In addition - have your tests included entering and exiting stream with
an ACL link active? That part always caused problems for me.


