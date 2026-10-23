Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AFFvWDwz;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HNZ4FoC/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=; b=AFFvWDwz2cp6FqsgjtoVqWVBsr
	4QuH0lsW9PTlfePEgTLmQ54QMAJbV0qWUMTwSjZsXPvGmP0WEC++FoTvmYGP3C5aUY50HAb7bELve
	ecfBTD4CV1uSMjT2kO8ODO8xYgmUgv/oInvS20Px5o+YP0eL0NyuvAZG6+n0M9MWLtGYUUYKOMv/c
	87bWmS+MhCZnLy4njyERP0slxjIX8QdibUmsiOqVlRE8A8H7JWW4anzJD7HZP/Ux2kO5sAR8cIVoE
	8vyghdvYhs6BzU2xs16vFdjqPVva89/ynfJjKvVEHGf8ka6MEfpBpNS2GKZpiInybi1ZdOuXxHc3Z
	Cb+1xFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKP5t-0000000HD17-3Jhu;
	Fri, 23 Oct 2026 23:54:41 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKP5r-0000000HD0l-0AmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:54:40 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3282db206d3so1652157eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799678; x=1793404478; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=HNZ4FoC/2KQdNtCVsNh9Hw9sReydOu3aZj1boBRSaXvHFlwh114JrNmdEYfZkM7Z56
         T2mlbOxGq9T+r9CvDc5vdHw1xc/cPepci5IbIQIlpKW/YRSceZmHK51Zwnnocys2rtHE
         X7/2W4gqbS97Co5Q07V4CjmDHtZe4V9fyTMuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799678; x=1793404478;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=eiKWeByy0ydqJzBPFY5ZXnXlSOfH7o5HDrY3mJQwkgOnt/6aihONvKjGEe9OMI5tOv
         Xtqot1E/OIroSc+0+BLTNytSbUoz5Owqy17ulb/AW6bzjYikxjcG5EbyYx9kbcPT91Nl
         mSJI5MTETJc8ltKXvMhxtxBpSkox9tRR75CNTwfWHr7AVq1bhXSQcnIiZQnZ0ZDbTBPA
         gh/XUbDb1VcOCZNt5IsuIa/lHwi2cca/7CPno8d4WUXeg1KDCCjx/PdzLgoutoDwzuHp
         OezfDau7icIEJvLJgNQCSQ/b3TRy6OgqdHPveELh1QuFzolQyECUYxHMPv9Gzt+kTdai
         xPQg==
X-Forwarded-Encrypted: i=1; AKwUvBzGMsbPKLax1Ohi8fMZhexVRlXY6PRRqbj2Z0rG0/GdgxCJSxOjnSs4XtA4tyH1nCquKWMcCNh42F7zdip72Afv@lists.infradead.org
X-Gm-Message-State: AFq9FYI2ogerP8SpNVkCM77ZTNteJezZYQOFxSC3CbNirJBudA5zF8hC
	wWNY6U5mf0K3FqHA5iYtsTQqR5e2A2EtqH1iq3HxT8xIuwM+1uY2/JvffwaRzAhT0Q==
X-Gm-Gg: AYBFou28EBmNOw+TAQyn4hYpZBK0ygU086Z5oXNt7YLJgm8KJ4TS8dxCRzUKmKuDNXh
	M8+Etak2pWZC+xJ098T237zokocDf7rmZCTImdc9hvplmtTjkZeGPcWimV80njBuA8dHIPkOLc6
	kNJRn/jPOenZwN3qS03loNYYYBJFJsW9wOPCH9ByWqjtXH/6kI0K6B8ySMmTTaGPCb7DlvheUPn
	bWK9tDinoj7NzQLZH3POzz11w7i9XpjyNk4TrDub6AvBwTSNalDQ/PphvrvsaTKn3cU6GclqSFA
	Eu4KLu7TeaiEHWT77niRFfsniLyOVMH8ddvEpOKK9wv3hDr1xZu8Tpl1vUkv3vowURV4K0dTxrZ
	pLHEptSgcmbLNe/OU7fuGfOwZrhDQ9XglarYdkBzfHQc4NMNobFG0819gPoqTg0cGfqLbEOBnPB
	5TLN6k5TK4ADOTQaX9vmO2LnT6A3M9kbgZQZHN3ruWdt9DmBUz3dh161ObMq+JpMUyuEQR5/pIu
	i4ovPIIVZM3bHjArcPDdvQ0EctT+FJPJaoKn35T5l8jA1QFcH5+8hwNcG6DDTuBhWouxt6KysWR
	R3yThxWq+QggTi4VG7RvgI17kP066ql0rx7qrJVw
X-Received: by 2002:a05:7301:1694:b0:366:eda6:8dae with SMTP id 5a478bee46e88-369e84b9a3amr1401168eec.18.1792799677639;
        Fri, 23 Oct 2026 16:54:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
Date: Fri, 23 Oct 2026 16:52:17 -0700
Message-ID: <20261023235408.3063350-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_165439_124135_0C84F51D 
X-CRM114-Status: GOOD (  19.20  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


The goal of this series is to land support for the goog-mba (MailBox
Array) IP block that's present in Pixel 10 phones.

As can be seen in the device-tree bindings for the goog-mba IP block,
the mailbox IP block in Pixel 10 phones is fairly sophisticated.
Notably:
* It has hardware features that support queuing, meaning that more
  than one mailbox message can be pending at a time.
* The "channels" in a given mailbox array aren't homogeneous. Each
  "channel" in the mailbox array can have a different amount of memory
  for messages. Really, the "channels" in a mailbox are considered to
  be full single-channel mailboxes and a grouping of mailboxes is
  considered a "mailbox array" (hence the IP block being named "mba")

In order to cleanly support `goog-mba`, improvements are made to the
mailbox core to allow `#mbox-cells = <0>` without a custom xlate and
to allow mailbox drivers that have more than one sub-node (`fwnode`).
For TX queue mode, as suggested in v1 review, `goog-mba` exposes each
hardware queue slot as a virtual mailbox channel rather than adding
queueing support to the mailbox core.

This is a fairly big rewrite from the downstream MBA driver shipping
on Pixel 10 phones, which jumped through some awkward hoops because of
the way it got queuing to work. It has been tested on a Pixel 10 Pro
XL (Mustang) together with work-in-progress Laguna CPM, pinctrl, PCIe,
and RTC drivers.

Link to previous versions:
v1: https://lore.kernel.org/r/20260714222338.2965707-1-dianders@chromium.org/

Changes in v2:
- Rename binding file to google,lga-mailbox-array.yaml.
- Drop generic "google,mailbox-array" fallback compatible.
- Add "google,tx-payload-words" property for queue-mode TX message size.
- Remove unused labels in DT example.
- Drop "dt-bindings: mailbox: Don't require #mbox-cells to be 1"
  (handled by deleting old mailbox.txt and updating dt-schema).
- Drop "mailbox: Simplify circular queue math with mod arithmetic" and
  "mailbox: Add support for mailbox controllers that can queue".
- Expose a mailbox channel per TX queue slot instead of adding
  `has_queue` to the mailbox core.
- For queue mode, read `google,tx-payload-words` from DT instead of
  detecting TX payload size on the first transfer.
- Match "google,lga-mailbox-array" instead of "google,mailbox-array".
- Move MAINTAINERS entries under GOOGLE TENSOR SoC SUPPORT.
- Use guard(spinlock_irqsave) and scoped_guard(spinlock).

Douglas Anderson (4):
  mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
  mailbox: Find a matching mailbox by fwnode rather than device
  dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
  mailbox: goog-mba: Introduce the goog-mba mailbox driver

 .../mailbox/google,lga-mailbox-array.yaml     | 226 +++++++
 MAINTAINERS                                   |   3 +
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/goog-mba-priv.h               | 130 ++++
 drivers/mailbox/goog-mba-trace.h              | 183 ++++++
 drivers/mailbox/goog-mba.c                    | 621 ++++++++++++++++++
 drivers/mailbox/mailbox.c                     |  16 +-
 include/linux/mailbox/goog-mba-message.h      |  38 ++
 include/linux/mailbox_controller.h            |   4 +
 10 files changed, 1229 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

-- 
2.56.0.257.gf7497c7d27-goog


