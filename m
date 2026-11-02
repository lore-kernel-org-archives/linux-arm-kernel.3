Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96410606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CxPYrMWO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nb87f5Mi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=; b=CxPYrMWOUachcL
	0dTtB+nEwW+nIINZbWsa5Qp5iqUp9dNdlJfkFbhsVn2D5IXCy1cfTKJLc9cf9rjKJUifHaxJSxvIA
	5L21CRT61dZC14BeX0o+OaxD6N87m0ILLt+M4MjVe+SJscy3DpCcu38D9qaZZC7CawdvWryqqxIxu
	CV3tFomF2rO/MsSNhnffgVbrFSQZ1PniyE7j7o8rYXIPDYR4VJ6ud9BlxvwBloZ+PgzDtd6pvYr96
	avM7LYf4gZn9m6+avLhKbE8pLv8E8Od6LJ7Uqb0RRL1Jnj2YZ/RJUQXqA3ny+nEHovKVunhQJrv1w
	ub4eXUj3niBcuLyGDr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN1-0000000FXxD-3SMC;
	Mon, 02 Nov 2026 05:14:11 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN0-0000000FXwK-0Rqw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:14:11 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-679965fb848so2490953d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 21:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793596449; cv=none;
        d=google.com; s=arc-20260327;
        b=UTucj36MRJerhArO63O5PabU3NRZBVbC6jj/TTbfwsol9S/lTvXgDc9U8yk3SxuMZ3
         cUytfrTrQpbkCiipyK49Bxy/HUXDuLKLkXnRI22NkIFxj12C1GrWQg807waZPlBAtEiN
         nRFiPaGCWtJo6lRuFMPZHTdDSTH0LSoPAVXpTbc7/vUGCsAOc0gfhaAO3U8QpMKTu2t+
         +WCsbcqflRdervQRH8EejuI98uuX03WW3OjVxb/nlYOHKNlZNKlNn/3DbVWgoHz5T9Rr
         q9RseqM6zKkvY1oagiUdZ59dWpOnZFOXshXR5WJlGe8C5UhMnwZYaemZ/JAYW/wvDKV9
         G+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=;
        fh=Jm5ioq8q+dI/cjGTo0AiBJMBVfi0FkxnVXzQPRIJtp0=;
        b=OclohhHUGAGEtOr8M0vLymIMhJAXrqrOvn8XNKwSP/vJdFuY/yU6ZasmJhOTHJ3I+M
         GZ93n01LFoOakuCTtf3OcH9Apik94OuwKckjjMOgMi4hpSOvJfkUr0yk8IY4QH+OZ5vG
         jPTjKLKTjeSh9rNEwI1RmeEOG+hO7kavMtiMGgNsRQXUXp52D+gPoMNqiB9dAWGENLqO
         r2kE76NR8hSnDqHRyKAvE5Z+GIxEawAHABnBU/RvQOortCzo4hcYAPDJ8aTmc7fuR2/Y
         EEsYkxlorwqJ2/E0vziPOkk0F/RjQHUYufzjlLJJXKmxZYwi7I+LCmxpEkKoCo61Sg4q
         xJbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793596449; x=1794201249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=;
        b=Nb87f5MiQQ+wzMd6iOYt+wcO2MN3Nu1C9YBO7wlC7WrA12Xd70MLhzlf7w7eEOyQUx
         vK6wyvB426YnPCryYGqlUQMalbzjrc70n1pkm5QSTMdzlmOGyeWR/Xkef/N3dK5uooP3
         VmtOuoLmUStBiF2i055z4DkKmI+L/atC5FwRMGW2LxDDhgIOnlW/nYGJAiaAyFqMoAe/
         45a5xz3QB6vnDiUFgChzHuukOjPUzTvW+oUix0HLNa19oUrWukWP6mxJJ/JU6CpPNt2b
         xgHnTQ16rU0iibBuU/Q6y6+IblAT+UIpE+BvQhyJASa7XbCo5XzWQ89WQ9Wnf+0Thy9K
         1ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793596449; x=1794201249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=;
        b=QAf7CYw7NwcrcrTt66maAuQ4iBMT+pjBfSOkRjLHXrRJRi7qzu78lCTTTDMBE9vlHk
         V7f4tPA2YhCJ031HGixSCrSYmUi7yIOLPE5sp49pMp+9oF12t7zxgXufcsXX7sdTtF5J
         RoqdHvkyu/0ytWzmQL9tFF9bHFSjtNHLKFkpSdrzqF+QM0rBcOAL3XZiXyi08KumH0aN
         9ijCVsyMsOEiaQ5u1AJzLv8TUlyNtubu0PrxyEEBDW1xncQmoRT3Nl6v/Vrzn8i9g23G
         +MwB6iyGl73Gu2qM7D1JVJWUf9ORI+4rhpdE5PwlfqRNpaYwA85iLJuLEOLrYybS4VKU
         FeMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjPEG8Qa7EZHwxuRnGfxgKJxK9kscgNQQ44C7eCb1d094DQyCW0Dptlpn4+yfkBWc5Tgqx9cy1jP6t6C1ABRNh@lists.infradead.org
X-Gm-Message-State: APuU4Z/83uCPerAFngaud1amdAGEJJCf/Hu19g7zNns+YAP2pl2+KDyd
	S5Oy71asZpxsZlNGBGIWYZ/SsWe2g2lOJdCfN5gDJpjdOHTBa2mPl77PUUmUW+Edg5wtTlvJPA2
	P86Pn5zL4N22i2Juo92fV2AgeMQezasMZqBPI
X-Gm-Gg: AYBFou144xhLMVof8s9WnFGfsMVL+CkJFLiUrJ4W3inhNxyTlNXolwLG5zr3yWRjxrw
	oBb+YhumDfks0s+cjVSvBdh/NIPQqaeTtb2Qfj0eAK0OQdTSD/3oqjQdd9tGxpJDpe4ZT9DyKGm
	QeaziQdgcPS4+dVS4Sroc2mACxQWtCcvunHGX51t9oJTC3U2WFKxEj4NDP6676jsKl8AO4hkPpz
	CfstaudIWUqhStB19ocCJYQdTE2BRcnLIiNWJDbz84WJX8L1xsgs+ik1HgQzn58CIbW0/zru3xc
	vTjjFoeeiJyVUi3pHRQHI8nW2rZFKdc8T+8LDd4fU2GUzLVA+lZ75/ZakzNcT2W1qwUFIHx67dM
	b0AnhxXyzdDY+rMcHxJQThYnA3kMlqrMdg35z
X-Received: by 2002:a05:690e:dcb:b0:672:bb7e:c919 with SMTP id
 956f58d0204a3-67ba4c909d1mr4822552d50.2.1793596448567; Sun, 01 Nov 2026
 21:14:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
In-Reply-To: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 2 Nov 2026 10:43:56 +0530
X-Gm-Features: AclHuK9Mvr8Imus9GpDjhEHLlkYTTfWG_3Dm8Qn9Rw_Yjm6XgiZ4JHgA2iLl30A
Message-ID: <CAKfKVtG4oCxJEvsQEDMxZSLbjSgzTxwMQ8Ky2Q9FtN3=6F+_rg@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: don't fail a read whose data is already in the
 RX FIFO
To: siddarth@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_211410_151015_080FF098 
X-CRM114-Status: GOOD (  21.73  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 6, 2026 at 12:21=E2=80=AFAM Siddarth Chilukuri via B4 Relay
<devnull+siddarth.nexthop.ai@kernel.org> wrote:
>
> From: Siddarth Chilukuri <siddarth@nexthop.ai>
>
> When the controller is the master receiver, TX_ERROR is set once the
> core has NACKed the last byte ("transmit complete" in PG090). We have
> seen xiic_process() run with TX_ERROR set but RX_FULL not yet set,
> while the RX FIFO already holds all of the remaining bytes of the
> message.
>
> xiic_process() treats TX_ERROR without RX_FULL as an error, so in this
> case it reinitializes the core, the data in the FIFO is lost, and the
> read returns -EIO even though it finished on the bus. The next read on
> the same adapter can also return stale data without reporting an error.
>
> Fix this by checking the RX FIFO in the error path. If the message is
> a read, there was no arbitration loss, and the FIFO has all of the
> remaining bytes, handle it the same way as RX_FULL and complete the
> message. Since IISR is toggle-on-write, only clear RX_FULL if it was
> actually set.
>
> We found this on a system with several AXI IIC controllers in one PCIe
> FPGA that share an interrupt. It only happens when at least two
> controllers are busy at the same time. With 12 QSFP-DD modules being
> read in parallel for 480 seconds, the failures went from 2083 -EIO and
> 1158 reads with wrong data (out of 11.2M reads) to none.
>
> Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddarth Chilukuri <siddarth@nexthop.ai>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

