Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2121AC3ABD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BT6JiNU7zVUtcWGo06dyNCKR86/Yl4O7QIBKqYCIBI=; b=MPCb5ctreqP1QVi3Ot0dv0WPWS
	oLznNHuRKSD+cwR62VOKPENdg86S1QZVVaVKSjaKbCwShszDmBY3SX48IKCJpFylAJZUv1fBLDtWz
	SyOFVRqfopzsepc+oteDwzdeUOsftTPQGZYXcsuckJXh1HBeacGr95VH++h8Xh+XdS+fO6gWzMEhc
	nkJ+EcEdGVBZDBfBi1qEzNQT6pm2pdcbNqz5dd+YVFMkTeFI2k0EmDoc7l4sRYmhtqd65NxQKJwKk
	ib8eQPkpmAjvlvFdQxKY5gtgD2DUp00V+7vttarX8gi+6t/GBaVaJ17xQWRLa6BcPlIsGOYa0j34n
	uWZqp+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHu-00000004mmM-08fe;
	Fri, 09 May 2025 20:25:42 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQvk-00000004Lkp-0Aos
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:50:37 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZvDfC6QXQz9s36;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmZ_rCyi93iu; Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZvDfC5bgPz9s2l;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B57FD8B776;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tsIaKHYPXzrZ; Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 353888B768;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
Message-ID: <40ccd7fb-a1c8-4fb0-8813-0575c4afe505@csgroup.eu>
Date: Fri, 9 May 2025 18:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, qiang.zhao@nxp.com,
 leoyang.li@nxp.com, nathan@kernel.org,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Tom Rix <trix@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230320125202.1721775-1-trix@redhat.com>
 <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_095036_228045_563498C1 
X-CRM114-Status: UNSURE (   7.89  )
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



Le 09/05/2025 à 16:28, Krzysztof Kozlowski a écrit :
> 
> On Mon, 20 Mar 2023 08:52:02 -0400, Tom Rix wrote:
>> clang with W=1 reports
>> drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
>>    'qe_ic_from_irq' [-Werror,-Wunused-function]
>> static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
>>                              ^
>> The use of this function was removed with
>> commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")
>>
>> [...]
> 
> 
> Commit from 2021:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F1619002613-18216-1-git-send-email-jiapeng.chong%40linux.alibaba.com%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cd5ee085f1ff64e69aec608dd8f05d608%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638823977413929827%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=kaeZGwikWMhIhz9iC6ZEVs%2Ffbd9UsZHJz7vBbODUHgg%3D&reserved=0
> 
> did not apply, but this applies.
> 
> I am annoying hitting this warning on every W=1 build, so:


Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> 
> Applied, thanks!
> 
> [1/1] soc: fsl: qe: remove unused qe_ic_from_irq function
>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fkrzk%2Flinux-dt%2Fc%2Fd47f1233374597c348696c3da2142cc92a36fc90&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cd5ee085f1ff64e69aec608dd8f05d608%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638823977413952218%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=HzwgkKFqffwtkmoskS9Y1OhlXShSW%2B%2BZLKxc3k3fCpA%3D&reserved=0
> 
> Best regards,


