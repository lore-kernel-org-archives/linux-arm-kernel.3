Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3A2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CWFIgEcK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JdvUKZze
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PlSoCgfZlJoJONbpF7eAC0swlGll9EuLKZNtFVx8kFY=; b=CWFIgEcKNBftQZfGIG15spaAlt
	YCBluYku6QyrXgBzQQ2sURqdQkv6vD083cbP87mjipbWFqnSQUsQpCxfVCjq9aqJbBd7edUnYjTVk
	CQCW1SpHEfh/7zBdClHDLmpSdbRL6LmKVtotSFegRGEoDz1g7upq0bxNCTC9tEmDUDPV4saMXua2n
	3ValgS0JS7T9mlkxKmIOrBdpMnnrCGrYchhlob1rGFamyUE9JZDtxb9fCXrZ0f4XKNvyrcoRKE7Gp
	nZhwuh35nGYdRh2YNBYIaUWIJM6fS0eX3+fre+VizgI2SCbnXMK4wJLLav2cGbrqbBGfXL4mpLtte
	1QYFWQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4yL-00000001QTu-14tA;
	Sun, 25 Oct 2026 20:37:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4yI-00000001QTX-41g8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:37:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4163559a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960657; x=1793565457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlSoCgfZlJoJONbpF7eAC0swlGll9EuLKZNtFVx8kFY=;
        b=JdvUKZzeKFKZAFL6KHChcXLZou8u3HdhpouVNqd29FBvDv4BqVHtCY9Jt5rJFw/hD0
         plH+OsyZ3p3+OkBLH4mS+Ketw4EEOpTNDGFLkosVjLBXjYx/qVnH3X3ahHSuUU6Px/1F
         v4IKNt633fvs3I6HAkaUfnft+Mpqu+01EkLOdVvsvVxMztdPbtS9XY3oTkIlBlsZtAmO
         yK9VCfqEsBVG3dsPUOrr+LF3dSCriRK2oH44egXHkEtj4Qao+iwnyoTSmmagyPo2qhsz
         IbwzF2ytH28bTVhz7OqcT2vUZSJKFckVWFx16K0gZVDOcA+hwe62k12BI2IzrPXnrpLj
         R8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960657; x=1793565457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlSoCgfZlJoJONbpF7eAC0swlGll9EuLKZNtFVx8kFY=;
        b=1npArubY5MGNQkCyqfFGHJW0Yzw29cTw4l2U/sHsTPSyNi2mdKx/zW8fxcLZXw53DY
         c4kvJThhKSYxNOj2wJtlxw47qZV9mWk5U/tcHr67CNFucAjvTuzfnZcUSD2Kkd27xaYd
         6QZ2q9Q2A1xpk+ZaRdT8/mFj9YXKr+ihRFpPnBEsbI8XcAj//aHNOL5kNVohHjtNwjE9
         hMBIB67E1wD0xqCz3Bq287AvA1uulw/+fp9ICNKsCOQpQ7qu55hUSGxoHHKIeVeG2yMm
         B41rrwQaCNMvogTdn9xMssnzN2zpsQawbiYljCpq1HgdOqF4Ek/hVfm1/LVWIGydihWp
         aOLA==
X-Gm-Message-State: AFq9FYLxlhBNcku5TgLgx96Cc8uE2jDC7/AaKmutUn2RbLdVXv37+Be0
	MOLszOCQQKGQWB3HtIk4DEeVm212L8Kqj1jqPs9D5YNvhJ6nWCOk+iN5
X-Gm-Gg: AYBFou2rP+zrlTeEc2h1CAAiiUG1D4jOTeCxiq+IySj4Fs6fDKxvFlE2BNJCMy0gkY6
	XPPTeVWeRKB68EplvAfkBoEw8UTIJjCefpSx7vf78jZepuKAOeXS/ls+DpfjEEWSzJrfhtrsENv
	W9CtX/mWVwP+HQl2a7oKVj4rTI1rbuomesa+s6eDVxtgc32+OJ0s1yqhZPMZc8Y6FSF2DP8w2ey
	QnX2taTkc+1O3NZckwK46yg5mrWCcYGnw0J06Uz0vkzemqelZuAJFvSlF8u6x6sXgukdYHhE+Ab
	8hry/e9lalpufKR6Pw9LpdwG1y3nhZMmpqvmhwYbLLPGhTs+eMyNOO//QRJSqfmQwYRRO6UYLLB
	CumO2P5GBBi8vaMTo43m0MamOp0tXHumSOXm+sL6bASaxo4yulJgfgV2pQ0x5q+m002rSMcKtpX
	S/xy5BPdM8HNNmstAUoqem+fJLSG/7EIXvuZ5N+Tq/MLqdD6h6FwuypXzEYmYrCBrdQGYG/cqco
	rJ4TpfbPSLhLoGOg4MGCWTMhqRXPoS3gWvp1jKZ7fYC4BsatmYzsPvLAVEHjD6wh/FngVAz1JnT
	QdSncQPJu8En7qkMQmA360k4gxGPMLsvrzoTY3As+vzimxkxL8VpMpOjhGedKL+KIKzseA14Omn
	RBJ1t9+8bmxMG8Im74U3/ejjiCYacweKY2Ew93Aqlhbuq
X-Received: by 2002:a05:6402:4008:b0:6b4:5d8c:95e2 with SMTP id 4fb4d7f45d1cf-6b45d8c97c7mr3366886a12.4.1792960656746;
        Sun, 25 Oct 2026 13:37:36 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm2693713a12.3.2026.10.25.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:37:36 -0700 (PDT)
Date: Sun, 25 Oct 2026 22:37:33 +0200
Message-ID: <e16c174c12a32614e0f6cf08301d344e@gmail.com>
From: Selby Mashiki <mashikiselby@gmail.com>
To: Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Selby Mashiki <mashikiselby@gmail.com>
Subject: Re: [PATCH] net: thunderx: fix fwnode_handle leak in bgx_init_of_phy()
In-Reply-To: <20261025203159.455100-1-mashikiselby@gmail.com>
References: <20261025203159.455100-1-mashikiselby@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_133739_056194_120F30E2 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Here is the additional information requested by the bot:

- Discovery: Found via a static analysis script scanning for
  device_for_each_child_node() / fwnode_for_each_child_node() loops that
  exit early without releasing the child fwnode_handle reference,
  followed by manual code inspection.
- Triggered vs. theoretical: Theoretical (found by static analysis and
  code inspection, not triggered at runtime).
- Hardware testing: Compile-tested only (-Werror); not tested on real
  Cavium ThunderX hardware as I do not have access to the device.

Best regards,
Selby Mashiki

