Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF829CFA454
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImGCMCLcj/skCiYbANA7Nn2kAh541W4YFyorni/4W34=; b=tYC5SKMyfTA0FMCtbbf/7b/vy5
	cqOiLdUH7l3DqJ7QU2qFh+IKpDyYoLqMprhTwguVp2XMdkpA0isjOe0B11CoGzwGS1lR/HICZkafE
	E+KkQ776ZkZ+P0SWjPg085d5n4QeE3yW0M3sxT3+eZ/Ekrwi003GoxiEzoeO8kkHbPo4CH2xqAtSz
	AEpBXizKH1E17GQaHYunWALwp3yglvRERPazDNjpKskPHXQZgloaEMI5S2uatEZV5wSW5cEzFhHxy
	JY8pK++kH1bMZehXrEDQB00QnISEfRbf+TPEwkK2/Bl99nm8RoeK3JBjaH5eHqENdt3hK+PT+X9e+
	y64/oRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3el0-0000000FHhk-1ot5;
	Wed, 23 Oct 2024 17:02:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e8y-0000000F8it-3yWu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ImGCMCLcj/skCiYbANA7Nn2kAh541W4YFyorni/4W34=; b=HVbRjksSHqKuzJtDpjZYyZa6Y7
	T4nYWsb++x8w3zRpACb+/qn0rfITAf/JLyCI7JVKn9NcjkLAZbtJ9yc45SPQgBNtIT+QT5m1BGqqE
	tMkKRRufaTGOZCa0xmu37FkgdR8G+YbNsB2YXSJWCeUcMBJngYHHOqOhCi00ClotfMlRdlL4i6FXZ
	H6mtzSnRoRYea82ukuikh4i3+nfFxcg+dXzx6KJuiof/3i4oDkb2UXtVg08d+C3cYNxNsp8IXIimZ
	eFomngmTtaVtHGkJS0iEz9/9OS8cdIEsqgmd7h3WO+5NwiZigSCZ9Z/CXdFuqBhaJhkvumOhjUW4e
	ezfLl8Uw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e8u-00000008RLm-3g4P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:23:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E875424F55;
	Wed, 23 Oct 2024 18:23:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LM4QKJJ_KumL; Wed, 23 Oct 2024 18:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1729700603; bh=ImGCMCLcj/skCiYbANA7Nn2kAh541W4YFyorni/4W34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBhD5Z2iVFfmKpdSW/evjvBUJawTiTTumRRO/Q+FtBNYlc+tp3mwM4tCBMcXP/Hvh
	 5l+8+NeYW5sllWZuLhhLWUGokX3pZNdf9ZZWbb+vKUjjDiu3AXuHz5BGJa8Lw/Wc4Z
	 4mTOtkQR9Xc2DESVrl5IcQ3Oo/Z1IPJjJERSmoIu5Rhk2RZ+Izzf3gqLT9EdPE8y8k
	 nvFCD8bkddNgrha80K6ja47euJ3Pp9jmZhFiOIAuOzrNXQuKQch1CWQsu3Uqta8WG4
	 AYKkovqFgO11xipB9v5pp7TPiGHCF36nhchbDp1B0i8owc4T+PmVTKNXgM9BASQ/Sx
	 qygChoYVCzn9A==
Date: Wed, 23 Oct 2024 16:22:58 +0000
From: Yao Zi <ziyao@disroot.org>
To: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io,
	gregkh@linuxfoundation.org, wangyuli@uniontech.com,
	torvalds@linux-foundation.org
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org, dushistov@mail.ru,
	fancer.lancer@gmail.com, geert@linux-m68k.org,
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
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
Message-ID: <Zxki4gooqoZfPoqD@pineapple>
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023080935.2945-2-kexybiscuit@aosc.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_172329_098734_97B184D6 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, Oct 23, 2024 at 04:09:34PM +0800, Kexy Biscuit wrote:
> Are the "compliance requirements" documented on docs.kernel.org? Who are
> responsible for them? Are all that are responsible employees of
> The Linux Foundation, which is regulated by the U.S. legislature?

These should be answered publicly, but IMHO too emotional to be included
in commit message.

As a newcoming contributor, I work on some ARM SoCs unpaid. It's really
a neat thing to write useful stuff for others, but this sort of removal
is weakening my and definitely others' trust to maintainers: people's
rights to maintain stuff written by themselves got removed silencely.
It doesn't sound like a good sign to me.

We need an explanation. The patch except the last paragraph looks good
to me.

Reviewed-by: Yao Zi <ziyao@disroot.org>

