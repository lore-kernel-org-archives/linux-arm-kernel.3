Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVzvuTyUjtH9weZSKpqwQ00wwpcaPEX3nD3RgOSp8jo=; b=FMdiM89XY+OzjiK1Ld33UIH0xQ
	5qWgob18tZzgoir5WgqifNfUrPW/R36jNBfnJ+cMsEPVHkb/1tQcagdkYI1y+LetUsX9ev6RsP1ft
	elr7CAwGqpzBKtKw/StXpzUVR1OH1t/QRC1D5TFcbJ3VxRoWJWNkFPHTaWWEd2lhCCfYw2TaKYaKF
	CtrPISK2ZNQjMqGqHywbipzDe/morCtlZ3cYBTEDFSZ+6A3Of2IoeFa1+YQStClYnntfzJZGdRYRY
	pNB5cJHHOmwMXnMiLBtBtKynzieotvkUgeUrOrJJvUWqu1okuBnRgqzUUpp8bFg56ggPXR0z7vo8S
	rTFHrcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gmV-000000091qf-3zBY;
	Tue, 29 Apr 2025 08:57:35 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gfn-0000000907L-0Z3V;
	Tue, 29 Apr 2025 08:50:41 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZmtbH6JVvz9sFT;
	Tue, 29 Apr 2025 10:22:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e30qWr8CZO0g; Tue, 29 Apr 2025 10:22:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZmtbG0699z9sCk;
	Tue, 29 Apr 2025 10:22:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F1CD98B766;
	Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2CpqnVV7VgEF; Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7F68B763;
	Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
Message-ID: <df566157-5320-47cf-ae14-a2e578f68a35@csgroup.eu>
Date: Tue, 29 Apr 2025 10:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] crypto: powerpc - drop redundant dependencies on
 PPC
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
 <20250422152716.5923-3-ebiggers@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250422152716.5923-3-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015039_365452_25AC1E95 
X-CRM114-Status: UNSURE (   4.85  )
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



Le 22/04/2025 à 17:27, Eric Biggers a écrit :
> From: Eric Biggers <ebiggers@google.com>
> 
> arch/powerpc/crypto/Kconfig is sourced only when CONFIG_PPC=y, so there
> is no need for the symbols defined inside it to depend on PPC.
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Note that there are other redundancies in the file, for instance 
CONFIG_VSX already depends on CONFIG_PPC64

Christophe


