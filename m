Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7424AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lmv66C0qFZcUIm9R7HIkRvONxM0fEIcf47qrSAs2f+M=; b=1Ys+eHFK8ps2ebz3e9K0oal+eH
	02doWMY5wltaSe1ZPbANDC6ZYpEu0v1xn+7P2wUDG02MVgmLBU6rJOgqmKpFzfF/WhAsOpc+skdDx
	gUFmKgxsioX8FB3mf+j4VpQ/cCVogc23dhX39qKAixqOp32DE9T5yyEG66TZ57aKkG78nFgEkSIZ3
	HBYdJVPoh9tFisoWxcVD+AQ7240VrJdZ22N/hNdhkib8kO0JwGTlX7y5ALLtqCeNLX1/tLGUy5G/3
	XL8SENc9boWl1YKZ7mS7FT6i8kVpK5NQ/nC4FwLkKwcgLgQTwz0kp5zDbWZXrE9AGTPvJzM545bcz
	s0ywVyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7F4-00000001ebl-2pnF;
	Wed, 30 Jul 2025 13:53:14 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7CY-00000001e0s-0QUi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:50:40 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsYKT1Fmbz9sr6;
	Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6arbvrYtM0X6; Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsYKT0PKHz9snk;
	Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 080558B76E;
	Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id A6h5hzYvNTWs; Wed, 30 Jul 2025 15:41:48 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 99FFE8B763;
	Wed, 30 Jul 2025 15:41:48 +0200 (CEST)
Message-ID: <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
Date: Wed, 30 Jul 2025 15:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the fsl tree
To: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250723094558.5bcfca69@canb.auug.org.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250723094558.5bcfca69@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065038_296992_7623F25D 
X-CRM114-Status: GOOD (  11.41  )
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

Hi all,

Le 23/07/2025 à 01:45, Stephen Rothwell a écrit :
> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>    8b3da0519ae6 ("soc: fsl: qe: convert set_multiple() to returning an integer")
> 
> This is commit
> 
>    12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an integer")
> 
> in the arm-soc tree.
> 


I was going to send a pull request for this fix but I see the duplicate 
patch is already tagged in the soc tree:

$ git tag --contains 12702f0c3834
next-20250728
next-20250730
soc-drivers-6.17

Shall I do anything or just ignore it and drop it from my tree ?

Thanks
Christophe

