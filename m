Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A06CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=; b=XlrXxBRSGoT85sgBihoAVdV0DR
	9demZROrp1WAAPcS8w6fg7bB9n0BRy/GrAf930MmTNmjn31+mrd49IJ0PpGREgB29ZB6h2PW1KbWS
	D0pnWQG9pIg753/19q6+YKToAI40W7rLPq3HmMcbansQx1V+y66odk3ZBPqkJNqfQ0aFh53B9RyLg
	nQDw/0TnR5ivUEVKVpZp2YLMj25msVd3gAe4xCYTuUN02U/fmegIZ7WzmwATVpPs8o+7wsKqTZra5
	lJTgeqmYwsrcM6rAES76JeScTuGPTnyN+celehUYIg9s5QbJlxMT75dnPXGfxHRLJ1zDg3vGguzwu
	DBxzZOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoZE-00000005FZv-1SVi;
	Wed, 30 Sep 2026 07:17:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoZC-00000005FZp-114X
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=; b=HgRkJd4qAUjHCppfCs6gp4kRFH
	1i+gqgF8xXYm/pspW5HiivIJm1rmgqUz086u6SFcH0OUIG4v1k+PW7P9s5QW19unPFroOy5tq8Bj5
	jFw3o8w/JoANwtwgNBgccdwkQFgqDtAreGlhwI2c5cVI24rYDeLPXE7iSxXKvQfIzQ4t61KApv73d
	Oo8QCtFBh81gt0vlQUuSC6fJS/vN/TKkgslItUdSLNUDNStqRRy6Qf0f9GZT27xxbGEbnO6tJA5t9
	gV/SIp7IcWQjODczQBOuadbMHpUDoom5d4xcNNl+05QBlh2evoWZ/DYrnnpDUyjbCmLjtInb9hPH5
	EyBhkJGQ==;
Received: from mail-lr2-x0f.google.com ([2a00:1450:4864:38::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBoZ8-00000003Sbi-3xfZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:17:25 +0000
Received: by mail-lr2-x0f.google.com with SMTP id 38308e7fff4ca-3a7756096e7so3038631fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790752640; cv=none;
        d=google.com; s=arc-20260327;
        b=IIdsHUIW2DktunKXpGbjPS91B1Mn1a6Ke1Vstf6fg6/b4rtw3IPV5Y7CIKE5QUZpYm
         U7epkuPcI4IokSH74IvNwscF8edCWuIwqcXg6OfZJkuVW/8oMtPFPkO+nnfGOGlUReSI
         vMkwWbKe6uHt9eMQQfyeyTxpicI5WNCETkYPEfMkb+Fq6OnLwbKCa2jNwPtnp9MNllcw
         KdjfrertNKB97Za05IWjz44BnpoQoF/o9z3mMWHoHGqo7OeN5Wpy57v6AWxpoYhCd2F9
         RvR0X2FXa9JLy5fHVlBF/zZpz9NgLH8JBmltwDPLkPsYXBbLFn3U5YqEVM7onWleE9TG
         BgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=;
        fh=jlIMkDHnQk640aNFavfC1FmjObgjMgKstoD8JTqYN1U=;
        b=ARAgAdiCyl6n4kXYDkSze67iBfUuxrYNtQU4Fl3+91AkxWwHYTeYlevpXln963k2tI
         GGpehZ4f3NgUn0/G3anI6TM2imDuhJAd4Xg6MSq8RZdkTnm6A32io8eflDxTH50W4Hc9
         WrNqpncijWwZJDCp646vk2adf2aaobBXhp2Gv/5ht5j+dE5pa0AuujVznpQ0C29PCIe9
         GdqWs40z1O0MGBeegiWHtLRaFHwybk3M7/sNtYe+hxTjhr7dlSQrmxjrlgVXMEKvXv+7
         05suB3RLdW5sG5kAwzS4zjeNJVzzH12TPGqK5vsqI7nGSYypT9n7n7o+khMygAz42Vmr
         weqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752640; x=1791357440; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=;
        b=dBibujaPrTWQk8OAN7tEg42/x++cHZtBHkDkNoklOcxDoeLHnNBc7nrbDeHq68sbQd
         PG+yTdhRdLiHj/DtF0MnaFm/HiTHEOOE3miSmzLryWTWAJTyTOqNbMVokrfv0S9vAVhE
         Jn4rs8SeLox5DTIK2lc8XB2hGcYQ2hLU9D68Bu+0wO52aX3pGihN1n1yguO9j53XxYcb
         vfg6AvLeouRvsj0UF0fW0mUstU9sZfthLyjLSrTRotNjcSzploVS6zaFur4jLeY2bTpc
         t61O0Iq8HNQR71wG+xMRb+j45rAu0WhmIVtQ3ANPJWzNQAZV+ZgM7pdxBZ8QO97w6kcB
         T06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752640; x=1791357440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=;
        b=1tHrgXKtH8OUFUoZNJ/k96pF3N1hu6W3sH++wSoDcVCY1/WVR8GYB8oQoVC1gwmc0T
         qJ52jTIfLoJFRa0iG+9f7pDyzOxeZPB1LrP42KUObQqfRlXRPElDzLv3lVZ+FBR2hqid
         B3Br5KBIWzexo32xWYgGYEr8mrrz66/evFOdJW/gPGfF3mAWvvJAbQxotslCU74EhW//
         xNcN1hRPhc8AP3RmXNlhh2itdGBapZFTCfzFTbFBe4YujUTXoxYPj+xnVK+qUe8WCZcA
         s6KNcpZcWyB8JJJTfbz03KZGdk0QCQxGj3UCfGay5y20aE5IZlfGq0yV6eB07dbzr1J/
         X6qA==
X-Forwarded-Encrypted: i=1; AKwUvBzcKIWhTEL9c7pGUXMQ+EXqCg6bma9g7Qtq1Gz863GBjkOnedBhTNqZ5mjuyjwUGAr107rgPCXUww8ijZALKwMA@lists.infradead.org
X-Gm-Message-State: AFq9FYKE/xyaNemQSefVmphDCjk34BmR55SXqgYuzgUgarCHkl/RpX2e
	E7DBdAdgslec9yeQ44PNw0nQ+HqOAlzM/KI+t3J1K2vU9jb+QfQ/KS6B0sF8gmTy5Z2ILNcLm3h
	JW+VKorLX39V1TJdDzQxqGxCm8UjUANA=
X-Gm-Gg: AYBFou14I3OKWP318eWJD5lmTfoNLg6GPh9f9WDg72+E0VZwbkY71zjtcJS2jPVtnGB
	ZGj1S3t1wK4rJZ2tQNFtMKbTJnMz+Q9DVM4UHfHWL86cGifux2mi4K2dk53qvkZk6AcRa2caPtt
	b9JJ0o75MIiLz6cyAbIR8/v3r5OnsvMdK552s5E25/tI0YmSTJiqawyxPLSMDLqdJHm64is0w2x
	+OuoF+sH7r0ruQjYJDTsmeZ9KXcC1p0fyXXtXtF7b1xHhUBpc+XX7y5NStkwlFOm4VQTng9P170
	HgpB2pHpNxtMP/2PVfV7fIyf/BFh4j8SfD4qdOYahdhw/mBIo5ulNA==
X-Received: by 2002:a05:651c:1547:b0:3a5:ba1e:8b05 with SMTP id
 38308e7fff4ca-3a77913af41mr1881391fa.1.1790752639889; Wed, 30 Sep 2026
 00:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260924135052.185129-1-maimon.sagi@gmail.com> <a3275288-1eae-463e-ba9f-dbb2d715d1b4@redhat.com>
In-Reply-To: <a3275288-1eae-463e-ba9f-dbb2d715d1b4@redhat.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Wed, 30 Sep 2026 10:16:52 +0300
X-Gm-Features: AclHuK-kag_H1kMGoxdUxezLS-VrTRKTJfJccb_2uUMkHaUSNrTcAhEimC6uRNY
Message-ID: <CAMuE1bHcd7LGW2VOa15hhWwc7otgtw30FmtcBsujwcoJvpQFvQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: axienet: bound TX completion cleanup by the
 NAPI budget
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, robert.hancock@calian.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_081723_262168_C79B0A0C 
X-CRM114-Status: GOOD (  21.01  )
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

On Tue, Sep 29, 2026 at 4:22=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/24/26 15:50, Sagi Maimon wrote:
> > axienet_tx_poll() passes lp->tx_bd_num to axienet_free_tx_chain() as
> > @nr_bds, and @budget is only forwarded to napi_consume_skb() as its
> > bulk-free hint.  Nothing limits the cleanup loop to the NAPI budget, so
> > the number of packets returned is bounded by the TX ring size rather
> > than by the budget, and the poll can report more work than it was
> > given:
> >
> >    eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
> >          returned 96, exceeding its budget of 64.
> >
> > Returning more than the budget breaks the NAPI contract.  It also makes
> > the "packets < budget" test in axienet_tx_poll() false, so
> > napi_complete_done() is skipped and TX completion interrupts are not
> > re-enabled on that pass.  NAPI reschedules the poll, so this recovers,
> > but the accounting is wrong either way.
> >
> > In steady state fewer descriptors complete per poll than the budget
> > allows, which is why this is rarely observed.  Triggering it needs more
> > than @budget completions outstanding at once - for example when TX
> > completion interrupts have not been taken for a while and a full ring i=
s
> > reclaimed in one go.
> >
> > Stop the loop once the budget is spent.
>
> Napi can process as much TX descriptor as available, even above `budget`
> see:
>
> https://elixir.bootlin.com/linux/v7.2.8/source/Documentation/networking/n=
api.rst#L68
>
> The solution would be capping axienet_tx_poll() return value to `budget`.

Agreed, and v4 does exactly that: the ring is still reclaimed in full,
and axienet_tx_poll() returns min(packets, budget), which also gives 0
for netpoll's budget of 0.  It is posted as "net: axienet: cap the TX
poll return value at the NAPI budget".

Thanks,
Sagi

pw-bot: cr

>
> /P
>

