Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75836C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdrO1+K6lbULchid8gHwSvq89eotortgz7vBoB5rT90=; b=03kiAeg4jRG3TE6I5Vot+IHegF
	TZLOFggUz+88wgQIRHUzgx9ft0D/p1TvSN7XKqJ8rOo56jaNmEKY5Q3Qtwqg0z7/8/V6fpx6MUXhb
	IHk8NR1EX+dvK/ocobw1x3nLHcmaAcjt3YFRCS1V7kQlofOosv9LPp4kDZNCF7wPGRNAqm0msLXoW
	jj7Q556ZtMBOGm9EDWuJPefGW40N6HI1eqafAEUeOsZv+GOJ93bkok/O1eUuREtsPvpK4QveM8RGx
	N/EZysSb5PSLurkyWtB8W27M59HSVNm5Je6eS0NJownJhYoZH0dqhzohq0gNVNKzf54ne0P5pkA4m
	oIDpf7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUXb-0000000FbHb-40wD;
	Sat, 26 Sep 2026 15:42:19 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUXa-0000000FbHD-1K9h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 15:42:19 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E7EBE415B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437337; bh=QdrO1+K6lbULchid8gHwSvq89eotortgz7vBoB5rT90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bTyB3RfRdPpLfHkXgrP6pyDoYOYpdqfGqegEL/Z/iEuUjlVzM/D4e2CyX35upetDM
	 zB15em514n5SYp/11AnjdM9Lel+AKpXBJnLlZgaien9OVbWOZjLN8zl4JN+CObTuuG
	 Xgz5+A19alzFlRj5t1/uFr7NWNvtSVAw2wtmWnwKHmsxCwIKw+xkzSFcHVywdmTEk4
	 7BvgP9iHWP++4JVw1NN4pqiMg5hZBC4LhzPvDxBunGHQTJlVrarCc7B8i3G1ll0qER
	 xY5ojRIQ2feqNZie90PO+OlX6vxVoJ5N3jzHezR4GmHZqrZ8XsTsFFrvekUDDepgPc
	 VLSxINX0jFr9w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E7EBE415B2;
	Sat, 26 Sep 2026 15:42:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Appana Durga Kedareswara rao
 <appana.durga.kedareswara.rao@amd.com>, Michal Simek
 <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: TMR manager: use literal blocks for console I/O
In-Reply-To: <20260921044912.97843-1-rdunlap@infradead.org>
References: <20260921044912.97843-1-rdunlap@infradead.org>
Date: Sat, 26 Sep 2026 09:42:16 -0600
Message-ID: <87y0co2f53.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_084218_362401_AB193CC9 
X-CRM114-Status: UNSURE (   8.75  )
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

Randy Dunlap <rdunlap@infradead.org> writes:

> Use literal blocks so that the console commands and their output
> are not joined together on one line.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager |   14 +++++-----
>  1 file changed, 8 insertions(+), 6 deletions(-)

Applied, thanks.

jon

