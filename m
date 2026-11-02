Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CDF606A597
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L/wxZZNp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SycXKhIY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=; b=L/wxZZNptY0iGt
	17DoLnNsOkEtlGED357pIcwyEufrmzxOjyEKbZu6n22pSCmYmyQFHo30mWkQa/h2VD87dHf53RxLe
	E9I/gmFBr1KkEEftaMjHHre3+yxz1epWWMxYwIFJuIBXJ8PbuYojN562+okrYfh54juhzZSLubr6m
	rFUeAnDP7YboroxHP/6QBrb6tzBcR4DlAR8gNXNp4rrVGe/CI3wCflCbl8rZrq4UrmPN9TrQndOMd
	etKipXwzxKqxOzWNiFp5WQ5gK0cj/KRaYH/o2P7BBiiABHnS0YF61LvIylGNQunAAF9TgbSZmxqdj
	RMYcDq1okheKtIWvfB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvuO-0000000HTHD-388l;
	Mon, 02 Nov 2026 17:33:24 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvuL-0000000HTFy-3dxK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:33:23 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36a1c464349so423491eec.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640801; x=1794245601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=;
        b=SycXKhIYyB/2erO0uC2dfNj0ewhEF6fAFGx99ovqaSBWh84TE/4wKWmX/xB8Wot2oZ
         Zgjzenw8/jTVP0AdWT62hhIVSiJEyIMw1jaISimGnyPfcDxU6PItLkz/ujwgwypPe/QC
         h77CnkYuGUwWyz+0vkKwQrf6hClXj6mR42Rd7acNUyZ3oqg8zn8z2vuPGWGRK3oRhuFO
         ehSTElhcueKLAWroHW0b6/2cgslsVxWuoctznubBck0HEgTkKLgqOcw9ymWNkgRYfEi4
         6SgEqIgC9gVVdC5zaARAwTwWGVQVCxgbE/Ki1KHgxu1zTgyCP/qUazqBW8L7e3v4gs6H
         G3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640801; x=1794245601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/cx/+IJYxJY/T4mwYf93gqtJrVbC9oaeH8AQlKwQuc=;
        b=Ub3HmKAEgT96h+vA8gb5mDAeKI0GHj5GVvSx038b0n5qcKSbicWqqPA8IjPsC0iad+
         7VsTbGGMf4/j0b86NkSfSa1ldW8SRriOur3PL5EMiWBIQESO4xxvFQJkWpiX4Q3q3uq7
         xJKZt9397Kc7bqPsYHXSKTHMGT746rwLalmRhjlxvvgjooN7TWzeuPMJRC0LBir0SL18
         sDu6L/jy9hhAukfSvPWIRGIfmYLMPhWGNCN4KY96KOWJYsXyq30NW1OEw4cUQ/TM9Gwj
         l4hwAsbpkx41PLDjepP5tg8/2HKa9w/4vcAec1Y/h+lAzR5D3e3LP1YoCS1Ok9ua1aRQ
         pr7w==
X-Forwarded-Encrypted: i=1; AKwUvBxsTu+V+FYAftmtrJ6qMWFYHme3L7GZJuPn/SNJV7MObFBAhnXEPjX6eQB/Qm2vK4RDaPOPAE9idUwLeQUV5rjw@lists.infradead.org
X-Gm-Message-State: APuU4Z9FbioPSAHosbW0VedFglZ73vwX5HDQKJLQ/pTsyD56xV0eHMgt
	aVXrqKnzhyBA87a45YERK1sf9B43oDIyoF9IkoWtpaIThd3Y7S5o8sdB
X-Gm-Gg: AYBFou3TJR9O6WVqWW42Lfb8/pKrcSmuxAohCPfmWGSal787tB36qfdZBnQMBz8x4/x
	8ygG06+19CmsiE1PAbIdXIYLdA1RMBTzPyqK2lI/1gtyy8zcqGdP+MAd6sf+B4U/knQN1XGjg00
	H3I3IWEMjT+ef3jG+oGyoq3qTzQaEr6wyzHaCjFvfu84QZlaVxjTNtWjCl9VzGjGJUUGCc02dVD
	0xvgwaTE+BEvOl1qJ4KTo4KeJd8IVDfI2mDBsjrNvHtKTk8CIaqBExC2AMcVlgBbngAjbghSwYh
	DNZ7ez26ORgGEAtfGNq9I79kwXDscVXUJ6XFX5HCzxPcruWSUoFHstVKU4yD4GI0BI8IcLRRojW
	ShWrcNGmiKygP7cWabfICwc4OeTIcvPLvEyliHRqFXphMcvrJgGKmlLlPzn1AW0ImKjpKhNY2PS
	lJPszAbsDHR9k7IafRLW4+OPlJCKMYlutDgaU8Z6kw8uO9ssWQdQiJSoBNH/D0nXD+USe3/Cly7
	WIZUY3tuh4oRGZK4LcySGq3wbPwdMTBkNlMqiP5Apk9rhyky/yGy0FOW9KBnw1TBj5cJrln9pE1
	sEUqar7ulOzOQa0Z8LM1xbbGt6k/We4XAUIEQZmadUDKQZ8BJFN/cRFCYETHPcpw+A==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a4235ceddmr21835977eec.2.1793640800547;
        Mon, 02 Nov 2026 09:33:20 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm33875716eec.5.2026.11.02.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:33:20 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
Date: Tue,  3 Nov 2026 02:33:03 +0900
Message-ID: <20261102173303.3464879-1-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102164345.523122-1-amergnat@baylibre.com>
References: <20261102164345.523122-1-amergnat@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_093321_912080_C91AFC53 
X-CRM114-Status: GOOD (  21.16  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexandre,

On Mon, Nov 02, 2026 at 04:43:45PM +0000, Alexandre Mergnat wrote:
> It fixes the range lookup of the getter and selects the trap 0 or trap 1
> registers at probe. Could you check it against the VEMC failures of your
> model? If it covers them, it may save you some work on your own fix. I
> have nothing for the overcurrent handling, so that part is all yours.

It covers them, thanks. Six of the nine failures in my cover letter
were about VEMC. As the model stood, three VEMC checks still failed on
your series, only because they change TOP_TRAP after probe. I changed
the model to probe once per trap value and to take the trap 1 trim from
0x1b1c, and then:

 - With VOSEL 6 and VOCAL 5, the unpatched driver reads 1.25 V, as you
   saw on hardware, and your series reads 2.55 V.
 - With trap 0 and with trap 1, all 176 VEMC selectors read back as
   they were set. Only the fields of that trap and the TMA key change,
   and the key is closed afterwards.
 - Trap 2 fails the probe, as your changelog says.
 - ASan reports nothing. With GCC 14 on arm64, each patch builds with
   W=1 on v7.2.12, where this file is the same as in for-next.

This is a model, so it is not a Tested-by. It takes 0x1b1c from your
patch, so it says nothing about that address. The MediaTek header and
driver I have don't define it. My own VEMC fix guessed bits [7:4] of
0x1b1b for that field, so I will drop it.

I will post the overcurrent fixes once I have tested them on my board.

Thanks also for testing 2/2 on hardware. That shows more than my model
could.

Mark, please take Alexandre's regmap patch instead of my 1/2. It is the
same change, it gets the BUCK_TOP key order right, and Alexandre can
run this driver and has the datasheet. My board is still locked and I
have no datasheet.

My 2/2 is not covered by Alexandre's series and is still needed, and
it now has Alexandre's Tested-by. It does not depend on either regmap
patch. It applies to regulator for-next on its own or on top of that
series, and both orders give the same file. I can resend it alone if
that is easier.

Claude, the AI assistant from my cover letter, ran these checks and
drafted this mail. I read both before sending.

