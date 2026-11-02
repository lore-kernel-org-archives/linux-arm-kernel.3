Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D76860722A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OMiNwlPi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kd581xpS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=; b=OMiNwlPig1YTDBqx/06lSAEIYS
	kJdey4BvvuDBXkXqo5/C5BnCdUMRJKJylFtqaQRu/am86TsZu23i3CX8qBI3pfr/Lw1rYwBZRINrK
	b6UXqYyrBVQdfrBBwM1votJhaKU9zoNu3x5rc3jbZHjryfolrPD9oggTJ+rowHyGonAfABAuRF+Yd
	t6RR7iRKsZlm3BAHHzW8lXXjVQth6ssmYKoHse+8t7/Sugt90BiJxaHXmmo0XLnC9WV7rTcZDk3dc
	L3GZhIf3djwMj7KV5rU7pnVArtOeiRz+bovazlYDurdtZ83en/2Yj+lOWnrSB1sHpTErEpcFe/Bw7
	TMUxDiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuuL-0000000HIf9-12Gk;
	Mon, 02 Nov 2026 16:29:17 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuuH-0000000HIda-2uaM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:29:16 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-4a24c19feacso1378980fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636952; x=1794241752; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=kd581xpSD15XbJdlYhi9hn8DhABbPi0zQnXBoZiwHVeO5MhA4JEqiXOkEIy1Eq7J0o
         f0nXKB6mEH70x5PSu7p+v3SOQiri0PcbPJIE3Qh7IoT53Qk7kLHT6pIjAEOGPHPWEBlR
         mUyqMxczbUXMNscmPBswTvZvzf9ER4NAOVXXmpyN7Ok2WqfMNXfpV+Q6eyFhIc93XcZT
         nOUgV8GvC7K1GAkENAGRx+wxzx4lqGdA5NKDs20NiwfMJ+nLFAHvWErk3+FlHvw2Fwoe
         5EdJZ3/UilfMZYjgHJx3zD9kUVHUfS3fSBaag9tZl5wwWPhkOkq6tQfAVdfxB5gIgmJK
         /MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636952; x=1794241752;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=ie3UZqsSe2xanjOy8DquF5JzVLtMFgPfO5MlHkuiWRCs3zLvtdKaNpesVQSahz1Lsr
         Eb4luoxHASdJ9C+N3Km9heOnbvhYKSX+aNDr1qaESHaKe4U2iJ4bH9cD8v+iEhAmTScN
         t6tEvevSzsyMElL8m0+Bzva488hGip9lDBEMrNfZ7mhKWwM5faFarS/w/xpKzY1jnYnp
         ENxc+mM5xh/MfFeh10yacC1d0gUfa1jInBkb5UH8uyGj8hRtjBQ/V0PFp8hCSmILAxCd
         ECprpoLBoCfHnS9T4LZ9tC8+qlEsuRg3m5zFljG0Y4txAEkJJNOF/9/1eu0+NBpVYbNS
         a/+w==
X-Forwarded-Encrypted: i=1; AKwUvBwD0PRVWLxSfwwQXw19iM5UnX0QfrrCCXkzHuiZB9hEa/y5kWzW3+uBMx9jK9k25SCq6G9EN8+o/XVtLvgbGTda@lists.infradead.org
X-Gm-Message-State: APuU4Z+EngrNVRW8EFZt5TaGHQYS2a8aWjbS+uEsZoHObykxx9MJBLf0
	J6UuybjHRs5MAmYWragv+9RhTqcngXcBldplDkQOYJS45OhOu1ET4zx6
X-Gm-Gg: AYBFou0OS49qzSuBZV05rQ4mPkKmemt1SVpK3X8olaKi8+gpBiY3x5OoORPHdJku+5L
	G+Tcjh60BigvaTsjwxIMWCWLYF9xMryHhQ92dE/NtNaOgmu9YShuHlqphRz8NQDHN4OdVhW1uoT
	4oiTiTcRUOdhOeiCGz1VLeGEPfQXmU0uSN2Xjd4ZA1riO9/bJV1t73an/o6xAOZKvGxkdOdy1gI
	R010jTLME9xbLobPvZMRnkgQ9ZRVGpLBGcbEOymmqu5ze5RhDZEGof9c+/zGPV54z45Z3sOO1dM
	40o8bbWFBaGRQC3bEsbw+GEhNTJJ7K2S32qX53i4HIW9FndyUTpS5RmbtLRXNe6LXKZqrMunJ6f
	3Wq3PhTidNwId8Ihv4oR64a9hfBwlVwEzfoUjd3ITw00UUwuz2AHNwVxHozEpaAJLQhDexJjNNn
	1lZhS+XLr7RAMJ6qotyGpiP4xUd4aFEUQq9P6Kh7k0eBzWeua/89aNyCSPoQPRmKB8oXU+ZBuTv
	hTvg6PvDOWeD4ZyKVUryP4iZljZLCa8vujFRfDG1ikKDi9lEiHAOvcOs1VgPU9AzevPXZHu2NDA
	lvF8D/DYE4c6es7jFDHjr1F26oj7XbkkvLB4Q2IdvWewxjWQbr96sFb8PUPpnDsGj905knjRSqG
	9b8uNG0GwIs3T8r5/JUw=
X-Received: by 2002:a05:6870:2dca:b0:49d:999d:c25a with SMTP id 586e51a60fabf-4a90729b213mr5773692fac.6.1793636952420;
        Mon, 02 Nov 2026 08:29:12 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a9219148cbsm6536719fac.3.2026.11.02.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:29:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:28:58 -0600
Subject: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-70a74a392015@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793636950; l=3537;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
 b=kC0RERhuUqoTk8as12WfjWIGdzHEwAzcXv3BQz1EAmrEV2a2RHogHoPYdNRcJAHP1bpdGIw29
 IyWH+b4r1bkASVyiHtRjVZPsvygEInH+Vw97GdpHLq7l7zt7e5pSCGg
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082913_749290_58F20D21 
X-CRM114-Status: GOOD (  20.08  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ssusb_gadget_suspend() removes the D+ pullup for system suspend by calling
mtu3_dev_on_off(mtu, 0) directly. That writes the hardware SOFT_CONN bit
but leaves mtu->softconnect alone, deliberately: ssusb_gadget_resume()
needs it to decide whether to pull up again.

wait_for_ip_sleep() then asks ssusb_gadget_ip_sleep_check() whether the IP
can sleep, and that function tests mtu->softconnect -- the gadget's intent
rather than the state of the pin. So it answers "pulled up, the IP can
sleep" for a device that was just disconnected, and the poll for
SSUSB_IP_SLEEP_STS runs to its 100 ms timeout:

  mtu3 11271000.usb: gadget (high-speed) pullup D-
  mtu3 11271000.usb: ip sleep failed!!!
  mtu3 11271000.usb: gadget (high-speed) pullup D+
  mtu3 11271000.usb: PM: dpm_run_callback(): mtu3_suspend returns -16
  PM: Some devices failed to suspend, or early wake event detected

and the suspend fails. The rule the hardware follows is stated in that
same function: the IP cannot sleep while D+ is not pulled up.

On an MT8173 tablet (Amazon Fire HD 10 2017, dr_mode = "peripheral") this
makes system suspend impossible whenever VBUS is present, which on a board
whose only USB port is also its charging input means whenever it is
charging. Unbinding the UDC, which clears mtu->softconnect through
mtu3_gadget_pullup() and so makes the check agree with the pin again, is
enough to let the same suspend succeed with the driver still bound and the
charger still attached:

  gadget bound   (softconnect=1): suspend returns -16, "ip sleep failed!!!"
  gadget unbound (softconnect=0): suspend completes, 20 s of 20 s

So record what mtu3_dev_on_off() actually wrote and test that instead.
Runtime suspend is unaffected: it does not soft disconnect, so the pullup
is still set and the IP-sleep poll is still performed.

Fixes: e69027c25361 ("usb: mtu3: allow system suspend during active gadget connection")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3.h      | 1 +
 drivers/usb/mtu3/mtu3_core.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..7f4fb87d8438 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -361,6 +361,7 @@ struct mtu3 {
 	unsigned is_self_powered:1;
 	unsigned test_mode:1;
 	unsigned softconnect:1;
+	unsigned pullup:1;
 	unsigned u1_enable:1;
 	unsigned u2_enable:1;
 	unsigned u3_capable:1;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..5ce61240194f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -346,6 +346,7 @@ void mtu3_dev_on_off(struct mtu3 *mtu, int is_on)
 	else
 		mtu3_hs_softconn_set(mtu, is_on);
 
+	mtu->pullup = !!is_on;
 	dev_info(mtu->dev, "gadget (%s) pullup D%s\n",
 		usb_speed_string(mtu->speed), is_on ? "+" : "-");
 }
@@ -1023,7 +1024,7 @@ bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
 		return true;
 
 	/* device is started and pullup D+, ip can sleep */
-	if (mtu->is_active && mtu->softconnect)
+	if (mtu->is_active && mtu->pullup)
 		return true;
 
 	/* ip can't sleep if not pullup D+ when support device mode */

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-c69c5104b25b

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


