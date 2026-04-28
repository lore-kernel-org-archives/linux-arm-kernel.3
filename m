Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F15CFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QczeZu7gF0v+2N++LTfsB6F6SrmXmtHT861C4vJJ1/8=; b=zutbt/wQEHnU/Rm9yzDJRTSiRN
	8k6uASTogPAvXFQjFU3WhmGvUFe5qRVvS/NjYa+Ynn70KXZj/Rath5snlduuGyYbzzeO5o8PoyO7L
	apRZFifuSPbULjukVgNqYd9ckuyzrhGYEGVLeszRQZJ6TTzha8Jb7JAIdWrcFSRG4j7mk6dS9pGkc
	D6vpZctL+oe8dHCFQHiEjPLJVtanxMMP0Ej3GhMs0kkbcR1MjvP6Xgk1pORCcxhlCFn+CbDoR2Wd8
	FXzejiZ3khtwlP6PXb1njd5NpMk0q3BWkDjMozsnsvg2ZYywcVt+gsdGI1lw0n38LIDVZqIQY2sWX
	Xb8Lpuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgzg-00000001NrF-3gJj;
	Tue, 28 Apr 2026 11:52:48 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgzd-00000001NpU-0gjJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:52:47 +0000
DKIM-Signature: a=rsa-sha256; bh=QczeZu7gF0v+2N++LTfsB6F6SrmXmtHT861C4vJJ1/8=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1777377143; v=1; x=1777809143;
 b=ccOUyYpOtcqIW1eTmfw27QEgWmyxLbAp2Fpl/1wRU+oj8IBLeRODoQukciDhCH4enEMh8dhF
 WJXAIwjf7QVzkJfNPr4bXWZshUXnOUhl+JaVDtq2Y1psg3uJfrm7037XeCapDa6ww4hEH3rYBPl
 gRNK6ToKvaBSGZt7fOQ3no+JR+2hSTjwa8P39dmjfnxOdxav4PyGlkNXApb6K3+dMBltubBb3Dr
 jGzJmE7Th9w9W7EwsNqtPZZ4gEBk2CedUJA6iGPVjdjOg9q3yb1lVmXav5Ux3uuJy8o+jW8nTIc
 zIkwZ72vKQsYJRY9AMXW82FTSeecMkL9fZ7iSOISL1O3A==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 986f9e12; Tue, 28 Apr 2026 13:52:23 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 13:52:23 +0200
Message-Id: <DI4RM3GB8BI6.1HBB04RO97J8O@matfyz.cz>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "David Wronek" <david@mainlining.org>,
 <phone-devel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: marvell: samsung-coreprimevelte:
 Increase touchscreen voltage
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz> <20260409-cprime-dt-fixes-v6-20-v1-1-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-1-8df6f88942c8@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_045245_668610_38083D68 
X-CRM114-Status: UNSURE (   8.53  )
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

Duje Mihanovi=C4=87, 2026-04-09T23:17:24+02:00:
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>
> The old 1.9V setting was found to be insufficient in certain
> environments (in my case cold ones), causing the touchscreen to register
> ghost touches and mostly ignore actual touches. Increase the voltage to
> 2.5V to correct the issue.
>
> Fixes: ec958b5b18c8 ("arm64: dts: samsung,coreprimevelte: add touchscreen=
")
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 2 +=
-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Karel Balej <balejk@matfyz.cz>

