Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F14C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3Oj8C9xs7OwFXcRq/GkyZSIdSxyR3ySBcFgGRhzAoc=; b=xHvEk280CkwDj5uIDCGZyP4CCd
	NWzvQk+hSVwW3GGPaxVjKjyEnyJAzCpOmlrhD2fZcpuihpBCcDCc2BvoKNuhcb6U7Be3/y+55i/FO
	GSFjoMm1w+no+H05zf8N2WAyjRFK3FdU2WGxkAiEEtgsA/OQqgbEYq+77+4zkYIasd7mSmFjvbf37
	XsQGS9Rt34iu5NRqeRDwO90xM4K/CipijBx7CWVN25joGq+ajOwZ7tRx1H1h/n7krxKiBBSXT3Fjv
	/qi6k5rHp5TO7Icqgzq2aYaEcdN2/zSooAyfjr1FPaGyUZvrEYB++z0gLdhNBiQOQ6PpLV5y2qqp2
	XGAnkSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AbN-00000000D3X-2OUo;
	Thu, 03 Sep 2026 16:47:49 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AbK-00000000D2J-0CUE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1788454057;
	bh=Q3Oj8C9xs7OwFXcRq/GkyZSIdSxyR3ySBcFgGRhzAoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SD6FLgKjZpg7hBVajIRSjlIeyxNnrdbaAniY2MdOiH9XjdQGPBzH3l97XwmV1VXvi
	 qSWmKP7pVsNbuWHFC5T1k1m/8ZyeGd1f2tRO+xN56BOp4eeI0ZacvHP83YyVdgvXZU
	 n5ae9Jsl711day4PMifqv/l/f+ztHgx3g77eZUbU=
Received: from LAPTOP-TKBJAGN4.localdomain ([2408:8256:2d01:e2b1:6136:e6c:8ed6:40aa])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id BDE212BE; Fri, 04 Sep 2026 00:47:30 +0800
X-QQ-mid: xmsmtpt1788454050t17u7474c
Message-ID: <tencent_578ACB00C8862E1EA60EAC378A712B69BE09@qq.com>
X-QQ-XMAILINFO: Nxj8FBgDHLvaAaHkTKbSIgNvPfh8cGOvp34W9fJQbK2woihxsiz3NmCGd+4qRs
	 cNZ58dn8flAQJit9kcgrCCVl3vX8RO6wA+6PBgHLoOCMhIGE/9CPIb9aQnhUyBYzGVO0GXU1dtV8
	 lHCWCeis5QgvEwQKJEF1Z9pblTUSGojqiPzAgm7esIjUHiAd4ydLZHjTlMRaCcwKZu0T6wHjx1N+
	 2MGOlqYx+WzUcvwIKWKmYefZvbHQpORQfYlB3Q1VCd7WKt7BkcQGIlK66EEGCJyjtCxe7rUSw78k
	 Sun3zlRh0/XhbMwIqRMplGsJWdBwb8SYorBIHR9ffFlsei3LIz1syEuo/wIXjAZPygmLk3hNg2ZI
	 pP2XMOsceMMYjS+RSGrK2Bs0gC9GKG+/E/N9ZmI1/o7SW/cR4ojp6cSVl/G46rda3xZ943IsR1rM
	 Uhl87uZyRAraaIgQiFbWO22w6rQpc0TsevuCa6PR+/NACfPN0mT8rzbXzbYMjNAuDVcZJLjriVV4
	 FPEjI45vgbgJQkgWEQ/lisD26HsxeWpD1LXQQW6lopLv6WcucNDYAHaFlv6SpeVxOh8k0YBLZ3gr
	 4Nw3Ep3llkgqdxFy3HWAnBB7Dld/kp42XoSPCLsHZqThOstOqIN2lPxf4ivP+wMicVIssrMJAbiG
	 8Aj5nNZVaCH786EcaRNp70wBgTc4llljPER3sVAqwpyNFLzndpNGRWV5d5An86echixihCRvMcCN
	 XovNGyKesvSnT3bX83FkL4HklJZbVQ/pmt7awmfuiJrEQLyv1sQeP2MHcvz7s0zGzfpLp3NzQwam
	 fqF4G8Y2OInVA8nXM29gxqK5qg8uEonMdaj/SZJDvb9YXBCPo8GA77nGkLDNpnSpLJp5eyYej7zK
	 u12vdBxrYbFFYqBgX3weDyhew7rthdLE9nteduQo8UYF00lXx1H1jBZBlwUVdLFfRNwhn3PaPs+o
	 5xVYsFHkjfKPyz48uloF6aapnhrr8eqgjr+PKgoB+Rd4J2sXLG16hFWJCA5ZYf4toPk+zulwzw73
	 KgNzLHCJ5dmUuFVUALcu6nskT9/a1qQK9ZB8in9WE7Yk492OyzKK5mXZDsWHg00LcdqH+YrMv5yv
	 f9yyzP9WmOOjJXOgJajEgRQmCCJpXHURiMt+sXkHIjlccBm7Gl3kCCgZLcbg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Haobin Jiang <lemonoutput@foxmail.com>
To: carlos.song@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	lemonoutput@foxmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v2] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Fri,  4 Sep 2026 00:47:00 +0800
X-OQ-MSGID: <20260903164700.3298-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <51425573-3687-486e-876d-f94d57844894@oss.nxp.com>
References: <51425573-3687-486e-876d-f94d57844894@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094746_649983_26A756D2 
X-CRM114-Status: GOOD (  20.87  )
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

Hi Carlos,

Thanks for the review, and sorry for the confusion my v2 caused on
several points. Let me answer your questions.

> Are you using AI to make this patch?

Yes, I did use an AI tool while preparing this patch, and I
apologise for not stating that upfront. I will describe how it was
used in the v3 changelog, as described in
Documentation/process/generated-content.rst.

> Have you meet one issue on one real platform? Can you share the
> detail about your devices and platform?

Yes, an i.MX6ULL on an ALIENTEK i.MX6ULL mini board, with an
ATECC608A at 0x60 on I2C1. I am writing an out-of-tree ECDSA driver
for it that reuses the wake pattern of the upstream atmel-i2c
helper (drivers/crypto/atmel-i2c.c): a wake token sent with
I2C_M_IGNORE_NAK through i2c_transfer_buffer_flags(). On i2c-imx
the transfer aborts with -ENXIO at the first, expected NAK because
the flag is silently dropped, so my driver had to fall back to
bit-banging SDA over GPIO to wake the chip. I will verify the bus
behaviour on that board with a logic analyzer and include the
results and captures with v3.

> After meet NACK, can i2c-imx controller continue to write or read
> data from FIFO, after NACK normally stop or repeat start, so I am
> not sure the i2c-imx controller HW will work normally, do you test
> this?

I will cover this with the tests attached to v3.

> Always goto the PIO path with I2C_M_IGNORE_NAK flag, it is better
> "return i2c_imx_acked(i2c_imx, false);"?

Agreed, v3 will do that.

> You don't really support the I2C_M_STOP in the code and
> intentionally ignore I2C_M_STOP check to avoid breaking the
> imx6qdl-ds,right? Do you work on this platform?

No, I don't have an imx6qdl-ds. The ov2659/SCCB reasoning in the v2
changelog came from reading the DT and driver code, not from
hardware, and it will be removed from v3. I2C_M_STOP will stay
rejected, as in patch [4].

While checking the code I found that patch [4] rejects
I2C_M_STOP, and in-tree ov2659 on imx6qdl-ds sets I2C_CLIENT_SCCB
(I2C_M_IGNORE_NAK | I2C_M_STOP) on every message, including the
chip-ID read at probe, so after [4] lands that probe might fail
with -EOPNOTSUPP. This is only from reading the code and I might be
wrong. Similarly, rejecting I2C_M_IGNORE_NAK might affect the
ATECC508A wake token on imx6qdl-gw5904.

> So can you please rebase your patch on patch[4]?

Yes, v3 will be rebased on top of [4].

I will also fix the sentence spacing in the changelog and comments
as you asked.

Regards,
Haobin


