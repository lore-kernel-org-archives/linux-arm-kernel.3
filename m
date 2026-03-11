Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3278D112583E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htNcIrOF+PFlw7zenOeO9FQia6dj2plkNS7IIsDXECk=; b=Y80X5fjw7EnQcu2akVrK4XSMoO
	oWBuk3FFiZXoEhuRAHhNLgRGitcV69XjpwwWxKYUJ8k1ChThEbVE7kHmZwrax3xGr1EqUw1t4jCeP
	n5EAG7ATEw4w+6WPpkKWyGwWOh6JWBa94vbvYFTMjD/zS3hzhskN7QeWbwDIvnnfHrTQDmyoehETj
	kNUeNiLjhKT/9YOng9ZDth2r4lvPClSFNE+HfexNTBoA7JGGkk9W+TV2+70rjLMt1Y2iATotqT8Ic
	IYD2MjCLMwLdI3iInHKzyizypmD6odt4u2Q72OqDcx+nMCW3bUV5Hf003cVZEebgLQjzLfQ707vJk
	E/2JZ+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LIF-0000000BmYY-1hRS;
	Wed, 11 Mar 2026 15:16:15 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LIB-0000000BmXy-1HUF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=htNc
	IrOF+PFlw7zenOeO9FQia6dj2plkNS7IIsDXECk=; b=cT4+KO/k8C+jdSBFDY0Q
	sVd+6v+MCCSF6rMMcemsuWX6HKt36keIjKr4J6lUGaUzZjUnJSknhgTppGTJdZPH
	n9ny6ULvYVTljCS/5v8RmHQ5IJhJ9nMVTkdOap2gC9UqLgNB7SS/LIk4lIzJ9zbn
	w0frs03i+Qx7m3h3w0d7wMPTKFuNSWV5jUEys7vVvVFAJbOqyBscA08ScdjoXDJN
	9YuV0fOTZmsxMIB6V74wGPI38+Uel8K9Uve8HkO5jvFkZJW/IJMzIPE7HTwD3JYy
	dv+KbDMFrlW7PrGGwQCBqiUGGkhM8g/s34JMvbGUxbTJbmxMsqZCQjFO74HPJ08Q
	oA==
Received: (qmail 3703507 invoked from network); 11 Mar 2026 16:16:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 16:16:04 +0100
X-UD-Smtp-Session: l3s3148p1@N5hEHcFMYUVUvUmE
Date: Wed, 11 Mar 2026 16:16:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use
 underscores in node names
Message-ID: <abGHM6-GgkRoAMZG@shikoro>
References: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_081612_207223_6D12B4C8 
X-CRM114-Status: UNSURE (   7.57  )
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

On Wed, Mar 11, 2026 at 03:58:07PM +0100, Geert Uytterhoeven wrote:
> Node names should not contain underscores; replace them by hyphens.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


