Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C115FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	Content-type:MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmCkvmN6o6bO9QADm6W/QC4PRSk13s/99dA2BWd17CM=; b=tKHI2NFm5a+kMNhS551oxHExA/
	SkbIJZGzm8grXxQIDx2GRra9vH+ufoNDVhcY0lKf36uELO5YJTy3U66a+uzX3LrHemtRHF2Slzssv
	LZjqy6shrbXxmJv88jM31LtAsPuXt/7lHQJY/8EdjcUVovvRNhtx05bc7oliLwLvXbSC7ejOVd45Y
	3LY7yzDpwgXujY7RKOp7oLP18ZTAavRvCD2cy7qCRE6hjOoLVIBUmchmFQOKYcPfZh3GKCzSueXGZ
	T8tXjx/Zi6nxUTammIqcz3EZl/lbyLqq/T+rfKp7IcTcdtLNztt18sIUt+Mmp68V7yyVt9kLZWA2c
	73Tb8mFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsHk-00000008POM-3C6A;
	Fri, 15 May 2026 13:09:00 +0000
Received: from acj35aaf124.lhr1.oracleemaildelivery.com ([130.35.116.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsHd-00000008PMQ-2lET
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=WmCkvmN6o6bO9QADm6W/QC4PRSk13s/99dA2BWd17CM=;
 b=Trzl58e05NFzMxI3+pQxQYPmoF18latc0kNh/F2OAc43opimE4Xx94F8F1aTUJPLmlqoYKoOGjhL
   sOygmrXVcOThNhSilX3jHwnQsXnkeSFyqL/Vi2I+LxA4uCopxfQekY7WIkHT1Io9Fa22qPSvS7y5
   Tp90TYdMQcATnifhU+N6NrRNsPEC3VNDJSiqOQK/4d/5FRdQlruUHD4GE+nzeDcu8NJUfQ4QPBp4
   ia7vgaxBu7ypSyrs0/090+r8k4FIT7KdvZsdWdyinnKAwO2yZ7ToX3Fd9OgUrZzRt5k/ZfBUyIFD
   qdfbD3XwqR7r25AiQnhzzBPlkWU5BvBypki5PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=WmCkvmN6o6bO9QADm6W/QC4PRSk13s/99dA2BWd17CM=;
 b=K8ksLF1aUQWDlYMWgQ4HM+9cVIFntibIy8hCLU72qMFbmnIC72lAhuasCdRoOvUte3TXujvAr0D3
   NYqj61QlfEjTMQzP27fmVzHkDJ5irvkhL94f5qqQwLitL9/J+FNKuLh50vgP5LOYCZd5+DmHbBF2
   mVL4inoUZ8h1VIIzBYZWqCQwZtL28riwHl0Kp/MxbZLcRDb96qbxSlTshP62HCE9JxzcI86k9yxa
   kD/gUIzJRloJMjELODPT0rw/WgzcIp2blyyEiQge73hoiZZxaB57Z2IDqeop2Z0aQXDzKqNwedEu
   tZ0k8ov5yduINgsA5+zHr84hu/aJa1VTIoh0+Q==
Received: by omta-ad1-fd3-1401-uk-london-1.omtaad1.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TF21Z7JRXUP8AA0@omta-ad1-fd3-1401-uk-london-1.omtaad1.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Fri, 15 May 2026 13:08:49 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 3/3] net: macb: add TX stall watchdog to
 recover from lost TCOMP interrupts
Date: Fri, 15 May 2026 14:08:49 +0100
Message-id: <20260515130849.920-1-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <20260514215459.36109-4-lukasz@raczylo.com>
References: <20260514215459.36109-1-lukasz@raczylo.com>
 <20260514215459.36109-4-lukasz@raczylo.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta: AAFF3HPCkK227CD7Se5cCyOO/blLikgODObmwE6SfhbsjUFD20BWLFJliQfsfrvY
 BFb1EX9GcB+16PC4cMFmM4XkUsoI59cMbEd5WXzoYSEAND5N2VkkfZ/igRwiIkX6
 GKnLNQKroT7O3tyf+KMwQlsClATKT657zTmtxir+9xFWsIDbTKSJD5Rau4a9TZlx
 3IsHc3E+ClKxIqQrAI8XMRHMMgvhb7vvCdscXI8atYGyjeUrfHgC85lBjenAY7Ap
 NCQ1YgdIe0BUN0h1vh5sePVZHsd82bb2HtYrMmCWn/cbjWpkvkeeZGLu+YfF2BR+
 zev9ZNP3hPdCuu1CWG764c6AcLk+fs1W1PxUhJmr8300ACa6l17xYczeq0SBSVow
 QQGfvXYWGH2p/rpuKOsZaOf8gB0v1qtgMI77gWthy4YKvh3G5GTNkEm0iZ5MqNd+ TYwy9uAVXA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_060855_000929_A72DB2ED 
X-CRM114-Status: UNSURE (   9.67  )
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

self NACK

This patch references netdev_warn_ratelimited(), which does not exist
in mainline net-next or in raspberrypi/linux rpi-6.18.y -- no
netdev_*_ratelimited() helper is defined.  I confused it with the
existing net_warn_ratelimited() / pr_warn_ratelimited() /
dev_warn_ratelimited() family while authoring v2.  The result fails
to build with implicit-function-declaration on every kernel that
includes <linux/netdevice.h>.

The bug was caught by John Laur via an independent build test on the
Talos Linux Pi 5 build and reported at:

  https://github.com/siderolabs/sbc-raspberrypi/issues/91#issuecomment-4456874307

I incorrectly tried to address this by sending a standalone fix-up
patch to netdev as:

  https://lore.kernel.org/netdev/20260515095336.92237-1-lukasz@raczylo.com/T/

Andrew Lunn pointed out that this is not the correct workflow on
netdev -- the right thing to do is self-NACK the broken patch on the
original thread, wait 24 hours, and resend the whole series as v3.
Apologies for the noise; this reply is that self-NACK.

Patches 1/3 and 2/3 do not reference netdev_warn_ratelimited() and
are unaffected by this build break; their content stands.  In v3:

  * 3/3 will use `if (printk_ratelimit()) netdev_warn(...)` in place
    of the non-existent netdev_warn_ratelimited(), matching the
    semantics intended in v2 (bounded log noise, retains the netdev
    prefix in the message).
  * The standalone fix-up patch above (Message-ID
    <20260515095336.92237-1-lukasz@raczylo.com>) should be considered
    withdrawn -- v3 supersedes it.
  * Cover letter will carry a changelog noting the v2->v3 delta and
    this self-NACK.

I will send v3 no earlier than 24 hours from this message, per
Andrew's guidance and standard netdev practice.

Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>

