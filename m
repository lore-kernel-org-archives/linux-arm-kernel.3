Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03137C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cGFVWEk/L87zAQqYZdNMd8YoKosd5LHXs3b+GVvAT0k=; b=hCuXk6P7b/t4HCXo9rS7wEpEi9
	+woI9vpp60xo2o9QkoZiW9fdaDsqvDnqfsWz7rxnzy2qspUaoGFw4TgC9JmkM44UgftdNdaO/YtKg
	EcRSkvqTx6j2l8aonw0OK7dUV4lobYQH7UGPWTjhMpJDBX7LDWIA9OU5mcP6NhynHvAy69MGWnnHU
	UVtNrxrinGhLcHHOC1sIitx21drWNhnpBuu9kVYW+LuYB1q2IWqahYauZfb1EGlLQr0w1fAMiEGcM
	12LZIPHaJ98w7DQkKVdmy/G0L5PBaCdJEJCevYkjXLTgItGiRfX2+alV3WmBjNUXnRh9AM+L44pIl
	5WgajmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8Rl-000000016TY-1WaW;
	Tue, 04 Aug 2026 06:16:17 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8Rj-000000016TB-2mte
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785824170;
	bh=cGFVWEk/L87zAQqYZdNMd8YoKosd5LHXs3b+GVvAT0k=;
	h=Subject:From:To:Cc:Date;
	b=eusIPTTuYbmRVVvOhrqMqqRgdx7nr8X+xGcc+Lb5c03llC7uSJ1VRV1Gq+zjBt4a9
	 jnII96cWyimPkHJKRjtcTIoEUUaLjsQggOKNyPcWA4/2VLqGLhZdF528vIM/SqHK4k
	 fFgj0XJvxwZn10h0uA3QwNZdIS4SISqwHQHKMjfEZqqjYAoPns3GfrTwNXLDB2zvkY
	 8bGTVTtO+oZk+A4+63X0XPkvtdFl0zn8Uox8A/Y998qL6LFrTpaTWv4mpXR7Wyzoiy
	 nHqYHX4o5fooh9nd36GSs4tVEHlvrej5DveWgF14izzCNlu/7X+QCI8n3V56+8BcGN
	 EcHnt2wayulCQ==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C43ED655A9;
	Tue,  4 Aug 2026 14:16:08 +0800 (AWST)
Message-ID: <7028fd175c1cab44bc7696b5cb92282180e1f0dc.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of driver changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 15:46:05 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_231615_912545_99027640 
X-CRM114-Status: UNSURE (   5.00  )
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

Hello SoC maintainers,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.3-drivers-0

for you to fetch changes up to 244b7f86d60544c99f6e3774fbf0e1aafd3a30f4:

  soc: aspeed: add missing MODULE_DEVICE_TABLE() (2026-08-04 13:46:20 +0930=
)

----------------------------------------------------------------
aspeed: First batch of driver changes for 7.3

Just the one patch adding MODULE_DEVICE_TABLE() where it was previously mis=
sing.

----------------------------------------------------------------
Pengpeng Hou (1):
      soc: aspeed: add missing MODULE_DEVICE_TABLE()

 drivers/soc/aspeed/aspeed-uart-routing.c | 1 +
 1 file changed, 1 insertion(+)

