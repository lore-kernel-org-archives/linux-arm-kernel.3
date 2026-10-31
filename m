Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F05A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aANzGXsz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T/aKthTr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=; b=aANzGXszjwHRPT
	v17DvYEh4E+p/2NJaZmwLiFKyiqd+KS5hx/t0mqGJQVyq7+eOoHc9uRufahhFnrsrgP0M9OcxTbG9
	2MMNigxD8KEWRu3hR3LhMJ6SyDX7kJzzs8MN6NNqjODEq2kIzlk5c9CQoVyMM8W8vAAnnf45Lmlf3
	h40fXYohyrX+j5YL1R1dEXqAQhUtTyVvIV05eNHxW+VqMeqQiSNbjCdBpMRhjovXvNdBH/jMDM91B
	4LheTEc6tVHlb8erp0xVRaZZDhTgDkZBXqXCs6YGqWM68yv995TOIG4/mnSjYDFiC86MAY/YdT0B/
	gGpOhIAlH6Hb1M6mcSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAzA-0000000DQpA-3HtG;
	Sat, 31 Oct 2026 15:27:12 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAz8-0000000DQoo-02lf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 15:27:11 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso1116430a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793460429; x=1794065229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
        b=T/aKthTrX+f3n44DGYY8HLpGRGIY9m7k7IuZl3EBW+XvigfSGrnulSfVRN1jc9VHeL
         VqUxuKqcfQd4/Cud9nFkzHiRgc60lqYuWHeAYeoxvtFc/jH3R7E9hC5GL6QA/AaVFiTs
         n+t+dYIYLgA+nqYFCt/utAJfhuBCc0P1wG1JHwemiTnl7pxW3mCzw+1QsxDNQzIFmBTY
         6L7lovDpyWe/79XHb43VgiMob07JcFk+V51WTd8WhLz2btoLZ8NTqJpL7Lh37lQqZNZ5
         hMxNCuhnTF1pKx8tbUlsEUytXbIG4lLkHd3IEu0S98hJ1YEC9aLBO2XBNHEzeLhnRRxv
         +PHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460429; x=1794065229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
        b=XUkQFuP5AVxqRGXrrwm3bzXxk+j9xMuPNAS3MDQPNYBPoZE8RZcBKw7GOfwq8XydRR
         J/bmXEwLSjC6y34+yHcthdshxP9OQjp9hSPcmOh/y14GvzqGcXbn7mZMtjCrNiqvmkHi
         Th0cUW/bjPnj3JgIl48G5SutQ6hvoMPJDxEUniu6iCFMs97deIUS/4k6P0i9WyA1bELk
         Je7PtbwB+JUBOaiweK2KiLlGoEpjy5yms2rNTo1HRo2ZUi184yTEbn02HEN6VLe0TwpD
         bThh92r0R7yqlIZGNPRlxjT7R9GRRFwfsQCMTd5vE0LPYzCb9r7ki7zesHxRxZlBK/B5
         FBqw==
X-Forwarded-Encrypted: i=1; AKwUvBy7yzv3aJ49wjbN2phOKvi+zkPraJluli3vWmpeimm3m1ZZyREgFQd61VQ+kaYa8rr3hmbuTmXlrYofV8cMhSdk@lists.infradead.org
X-Gm-Message-State: AFq9FYLBs6c83gkNIPfX96ZvOEV7uQPhUfODOvif7S2uyKbFGuEUHiZP
	B0IEILU1qAecB1d+BC6ozt6T7tuYj3u+r2UlRWhv2E8CXGffVHDOr9Ud
X-Gm-Gg: AYBFou1ZHvuYpFc9NWNVDJvNdjH4ldecMRgwpebb48aDtnBYoLPYNsV0hKzQAHFOD+j
	zQ3WJIg5Ual2p6ho1ABK0FPr9IHjPxaUsJwuVvdF7mWG2jTenVDFa7aeKLcOZL8E8UP/emngb8h
	mqasG9HencWSwfNpaDIgaOW/8YVKWpexD9lQTkncuTnOlEc11W60GMfOPIJHyFpXKeYEeUegxTZ
	suLX2wLZ1xwcWsMmUc9h0JJdh5Lv+Xp9aWS5RNt8uUw6OWmO+Wu6cME/0VUUOqU4iYQN3re0JXj
	Ox/b1DjHNUM530I9VHFVJEUy8BvLlCoagheglY3cdcTc9sKEOMkwj8Eh+n3vs0cfwuwGYiY7OPE
	TwKNu/NUFgz9L506xA/aqb6iiEfwakqr9gpOzuZAdDFi3mnyVQQKn7kBsVat/YQQ/Syqj7nyyzA
	LomOJGoYXYtYeMg5O3OlwpIsOqRG+/etk/uz/HWH0A5IctNgNpuW9N2rZldZOX8R5Y4pP/u9nTv
	ItFAUrEj/4u6s0ELMzut3SQb/nTjwbYSoBR2Dh68K1wa3/dP/VPCWllZ/wxk652w5kONZx56o4g
	LQ6ewL4cdXGXtm/upJMSmqfA89tMKfEQ0KD6QEdhlIzoKoiVg03r
X-Received: by 2002:a17:90b:534b:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ae898127f4mr4404747a91.24.1793460428503;
        Sat, 31 Oct 2026 08:27:08 -0700 (PDT)
Received: from kei ([222.141.54.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09615125sm1731025a12.1.2026.10.31.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:27:07 -0700 (PDT)
From: tianci xie <xiex16070@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Samarth Narang <samarth.colleges@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tianci xie <xiex16070@gmail.com>
Subject: [PATCH 0/1] tty: serial: samsung: fix TX fifo underflow on flush race
Date: Sat, 31 Oct 2026 23:26:55 +0800
Message-ID: <20261031152656.1422-1-xiex16070@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <2026103122-repurpose-cost-2da7@gregkh>
References: <2026103122-repurpose-cost-2da7@gregkh>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_082710_078457_11E3BBBB 
X-CRM114-Status: GOOD (  19.80  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 09:54:55AM +0100, Greg Kroah-Hartman wrote:
> Always just send us patches, after testing them, you never need to ask
> if you should do so.

Understood.  Here is the samsung_tty part of the report; the other four
drivers are separate and I have not touched them.

The analysis holds up against mainline.  Neither s3c64xx_serial_ops nor
apple_s5l_serial_ops has a ->flush_buffer() callback, and
s3c24xx_serial_tx_dma_complete() samples tx_bytes_requested before it
takes the port lock.  A completion that raced with uart_flush_buffer()
therefore advances the freshly reset kfifo by the byte count of the
discarded transfer, and since kfifo_skip_count() does not clamp, ->out
passes ->in and kfifo_len() wraps.

One detail worth adding to the report.  In 29bef7990845, where TX DMA was
introduced, the callback advanced the buffer with

	xmit->tail = (xmit->tail + count) & (UART_XMIT_SIZE - 1);

so an over-advance was masked away and could not wrap.  The wrap only
became possible once the driver moved to the kfifo helpers, which drop
the mask.  That is probably why this never showed up on the older code.

The patch follows the 8250 fix in 9e512eaaf8f4, with one addition.  The
8250 changelog says that clearing the outstanding byte count under the
port lock is sufficient "since the port lock is held when the kfifo is
reset in uart_flush_buffer() and in __dma_tx_complete()".  That holds for
8250 because __dma_tx_complete() reads tx_size inside the lock.  Here the
count is read before the lock, so clearing alone would not help; the
patch also moves the sample under the lock.  The same gap applies to
serial-tegra as reported.

Testing so far:

  - BUILD_RESULT: builds cleanly with gcc 12.3 on x86_64 (COMPILE_TEST,
    CONFIG_SERIAL_SAMSUNG=m, W=1) and with aarch64-linux-gcc 13.3.0 on
    arm64 (arm64 defconfig, which enables ARCH_EXYNOS, ARCH_APPLE and
    SERIAL_SAMSUNG_CONSOLE); no warnings from the new code.
  - BOOT_OR_RUNTIME_RESULT: not booted; I have no Exynos or Apple board.
    Runtime behaviour is covered by the exhaustive interleaving model.
  - the patch applies to mainline at 83f32c773255 with git am;
  - a model of the two actors, with the kfifo semantics taken from
    include/linux/kfifo.h, exhausts every interleaving under the port
    lock: the unpatched callback wraps kfifo_len() in all four flush
    scenarios, the patched one in none, and both agree when no flush
    happens.

I do not have a Linux machine of my own.  The x86_64 build above was run
on a rented Linux server, and the arm64 build was cross-compiled there
with a no-libc aarch64 toolchain; that is as far as I can take testing
without hardware.  There is no Exynos or Apple board available to me, so
the model is what stands in for a runtime reproduction.  If you would
rather have the flush modelled as a KUnit test in the tree, say so and I
will send that instead.

Thanks,
tianci xie


tianci xie (1):
  tty: serial: samsung: fix TX fifo underflow on flush race

 drivers/tty/serial/samsung_tty.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)


