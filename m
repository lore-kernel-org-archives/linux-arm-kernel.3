Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5D6CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0UhANzgUlH19K7KH1jt+ruUoBQdgOK17Gry3ZW97T4=; b=f9idEGbEZ+yOxpZD9AQCQLy8Ps
	8nD6MZZ9Rfj2xZBYVrxvQUYMEfRJwHGhhNutvJIDtnZD6G2FAJE25SaotH13asw73QVrPmtJx5twJ
	ESt8YMSQcf+ypCMueOZOkyLoXILup9VtpHltJtF+uBTCG4BJTGIKrEuDXmg4bSOjGAr7F4KmUHag/
	jJ1tm4VYuwrKaxTCyHyQOH8emUzG5i5Zl6PDql/vHwDrHMCMbRwADvf79U6CX7KE744DE/p9wLZ7N
	9pZB8X7INNZbpZXFpljAUNNLpm1OIkU7pcvQlQ68oX9xvRqpGpSwyvKPPX+J7ogH189RZakPC1bUk
	UHfEef+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4iuF-0000000ClFg-3Oc3;
	Fri, 03 Oct 2025 16:45:19 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4iuC-0000000ClDp-1jcW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 16:45:18 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 5C5AC72C8CC;
	Fri,  3 Oct 2025 19:45:11 +0300 (MSK)
Received: by imap.altlinux.org (Postfix, from userid 705)
	id 4F2B736D070F; Fri,  3 Oct 2025 19:45:11 +0300 (MSK)
Date: Fri, 3 Oct 2025 19:45:11 +0300
From: Michael Shigorin <mike@altlinux.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Michael Shigorin <mike@altlinux.ru>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>,
	jeffbai@aosc.io, gregkh@linuxfoundation.org, wangyuli@uniontech.com,
	aospan@netup.ru, conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org,
	dushistov@mail.ru, fancer.lancer@gmail.com, geert@linux-m68k.org,
	hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
	ntb@lists.linux.dev, patches@lists.linux.dev,
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Subject: Re: what about CoC?
Message-ID: <20251003164511.GK7291@imap.altlinux.org>
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
 <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <20241024095339.GA32487@imap.altlinux.org>
 <20251001101148.GA30625@imap.altlinux.org>
 <87371abc-e43f-4afb-83d0-b9a04fc015c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87371abc-e43f-4afb-83d0-b9a04fc015c0@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_094516_617054_A0E31C30 
X-CRM114-Status: UNSURE (   5.12  )
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

On Fri, Oct 03, 2025 at 05:48:40PM +0200, Alexander Lobakin wrote:
> It's about companies that sponsor the war or are a part of it.

So ban Intel.

-- 
Michael Shigorin
...хотя вырусь не поймёт даже почему

