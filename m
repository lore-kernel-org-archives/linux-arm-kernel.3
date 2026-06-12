Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F95CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPU7Ldw4ipIoEcVrCmQaXXpe58uZWSTdE8XRrKsUz/U=; b=gF9QygCu2nmAqLKmKfxz8iKqom
	gYGC3oLYqGEkbquddr3tnSQqNqzUDqeymwnGeBsCnwXW8f1Ju5yh/pNZvDE6eCxiGIZAK4eVfj6m2
	C8wvg2NV1sBtpNpgS5DGMfiGCNvnw24JTiI5/yIvAOGRFg7OCO2hgNJ08R73qe6Pkk1jM9ppuEHqV
	BWJUFxab/QAxgDh7FyGTiB7aT2R3MKVIZuL7f9/w8QCnIbQYBN1KJUG66CBAbYVLusVlEGCxoXMPX
	AMoa04UAImXs6dDl9Kz4cJgfIsYca2ZzVoeBSvZ0TUnY1zDYi71NPSrg+OzcFOjnVUmFO4pnIV2a9
	LDNQxwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7wg-0000000BVWF-1SOo;
	Fri, 12 Jun 2026 19:53:38 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7wd-0000000BVVx-1ESq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1781294014;
 bh=pPU7Ldw4ipIoEcVrCmQaXXpe58uZWSTdE8XRrKsUz/U=;
 b=U70C2QiaqbjPvEVR/8aQK8q5S++yHVBqNlweTAQ4ZyBV1ogKN8UvJj9+Wz22hcVa1GzS6gESa
 6PkUal1wP9c1xfvWORgRHRzKUtUti1dFWWpd4lFt5GVM7YRtqQa+nD9UYf2m1aejv9ZF9z747TU
 D1QktqmPxBb2xAlJhO+UDiiV2fG0BGcF+WNXk1APxKbptBylK+1t13eAl0bEq4p85PRe6+nKJ92
 RZ7rIZb5Vo0/mjmekA1NEkVquXFt1fZuI/PzIFxZMXKRiLOHyhDmN3i9BMuATOlAwxCv78Oz61p
 5/zUcavKTJ4mAH9MA3ARng0Xq+SGB/+FL4kINqwIO5UQ==
X-Forward-Email-ID: 6a2c63b8edbf0df789293751
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.26
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 12 Jun 2026 15:53:27 -0400
Message-Id: <DJ7C0Y4EREJC.3ISWKDCT9I07R@ubuntu.com>
Subject: Re: [PATCH v2] power: supply: macsmc: Support macOS 27 SMC firmware
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Sebastian
 Reichel" <sre@kernel.org>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260612-gate-power-v2-1-de76cb9bb7ef@chaosmail.tech>
In-Reply-To: <20260612-gate-power-v2-1-de76cb9bb7ef@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_125335_665264_B3F5428D 
X-CRM114-Status: UNSURE (   7.45  )
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

On Fri Jun 12, 2026 at 2:36 PM EDT, Sasha Finkelstein wrote:
> The SMC firmware included in macOS 27 changed the size of BCF0 key from
> 4 to 1 bytes. This key is used for indicating that battery state is
> critically low.
>
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - Addressing review feedback
> - Link to v1: https://patch.msgid.link/20260611-gate-power-v1-1-8a6272108=
6c7@chaosmail.tech
> ---
>  drivers/power/supply/macsmc-power.c | 35 +++++++++++++++++++++++++++++++=
+---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

