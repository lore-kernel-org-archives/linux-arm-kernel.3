Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CBA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B+yZFlDS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sfgDtCOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=; b=B+yZFlDScjgmgz
	BiSMxLYfsFsOjYXuPkYSehXvsXaozUs0k0iAQnBumue3NEGHbiCGgO3W5rpp0Y7JjvMLXJ9OR9LWP
	cdUOgyHZKPMEyFZd741XTpDYpMAIE8K2cMSse2BJXMSaysyiST8KoFsbbf7aA9nv4FJ6o7xsPck41
	G+5hIFWJt6IF6pkl4+3ZcKBsDwz7wJ0V8X7nXJbOg4QPEo797qTsIvTdguSj5Cnq3s1FydyDF3DVZ
	bc3jueQCzFVmZLpMZaXu1E21u+1qox8Y7waar7Mw8wJHLigPpfn0LTaTBat7mB6VYSq/cz3bBQu49
	ZeUcozLSpdjUzc4NUGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFc7-00000001uk7-3LYI;
	Mon, 26 Oct 2026 07:59:27 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFc5-00000001ujS-10wX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 07:59:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so313130a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793001564; x=1793606364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
        b=sfgDtCOLge0UN67kb2gfkxYpP27oZGxtTSNeis6tVC5VBl4Hsehfnzea5kNEl1CLd+
         /UsZ3i9SRThmXpmdMXeziigDm+061lasK0rOT6oMfgSlfzUwf+kS1Cu4ClPWgWbcB035
         /zDKvaR95kMS5PvJ5a1r1n8z97H83uLNRrs1WF8ZOlUy7V7ArTZepF9Qjxg8cPaEv8p2
         6y2poWdRzPCG63paMzHnL7yDewe7wuKpbm8nHxzjyKdQWDQZu5TkbNgN+uY4ZcOGTR+D
         PEMyrFAt/8hLfS3+ZsegWtbjm8+Kscn1H0r5qrEWwBWWnFnel7VBwMry4k5Kfm7TcM+N
         qsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001564; x=1793606364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
        b=oDkL04roOua5zPNRdi3OIV88M7A0U5iVyOkC/cDc4AsHuEo9aBA1v2YKwJoueOwMA9
         OOkcDtUFSs+F0MmNuZoyIElZV4dt0vE89QDYHOHffUCBBwT1Xp4SWzKHXwcrgbxrzv89
         +XB+ZMWNMpO/djqzjIFdBV2cr85nYSiOX+f2/+ghtX49watsE3mKJQmFZRrbtecka+nI
         7ZametWhCO7gMD0XxGDFjTXDfNUVybivB3dtRPkmSNbHpCC/fl3iJ92DAKnVj6Bc4dRO
         dkxkN4MP1BXREhLOfd13Nd/lBftk/7zMcufp4eKAJgHoebI0C3l++dcGt6UlZF3eXLIU
         XpZA==
X-Forwarded-Encrypted: i=1; AKwUvByS9LQDcHPTsb0Ib0ClXA4HXjiUJEa4x0Iwu6fHQfsNUQ3NW99Gk2ciJbFFz7QSbLDwCvZaJJYLZmzM8CLAb353@lists.infradead.org
X-Gm-Message-State: AFq9FYLfssPHaSgcbxV/+M49lg0u8OIYFvdGTtL2bM4XL3PBh9K3oO8a
	EUnK0JYkYCq+9Jep5rHcyR8hRl8+ttd9qoiIEtNlQxHrrLb2OJbWGPRj
X-Gm-Gg: AYBFou3lTQ+qoA+5lvygBOp6wot/ZTcJUS89rybIIppmOWsPSf7TgWdTrSh12ZAa/f/
	6sOB3JavfFmuBaj2+D9m12DTLeLdKbOFYD8RG0RbJk+ANBiemF7fsdwvOmOO/LFJ8MTvZL0Wyze
	rR7wVgZz51a6TcMVEq512pZpWJ3tCzwcn+PJ7ioTEd4fLUoTFIAyFWB4bpNb14i3ZHdZzmC6I7t
	/KEdtn4Y6Heow2I/KpKQ3ezrCkqh6JcaXtU9ENQRfdmKui0BtvtMw6xjestdx5vXFN4nGENRuBk
	1iPFoNhki7xC/ymLOz6U8BByPGlNDa8XZQl+GQ2gceYTdmn008qwCNlB8HFlrTpjQliteN0Ql0E
	vwEUiNOGlmhOv0kjfkKlGOegxIe6P9X1+o/nQQWsFvTZgfbICQljoFWhcRPhapAQn3mPgJbYRgl
	YOKDiI+oGtbBocby0sUZrcoUllCM66optuep3Ht6p+urQQWgFC9YUw8ylBP1i28ZZ+ZhormUz40
	TOii8BAv/RJGtcxZDEYr0go1yzZs6n73EJjtYlW4B94GNpFWzpzQM6SxtwsBtsJD83VQjdLYZrO
	GsQO
X-Received: by 2002:a17:90b:2d84:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3adeaf9ce48mr9020240a91.4.1793001563928;
        Mon, 26 Oct 2026 00:59:23 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7490258a91.12.2026.10.26.00.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:59:23 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Mon, 26 Oct 2026 15:59:14 +0800
Message-ID: <20261026075915.203854-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
References: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_005925_309920_D6D29B7B 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Krzysztof,

On 2026-10-26  7:08 UTC, Krzysztof Kozlowski wrote:
>> The ArmSoM Sige7s is an RK3588S-based single-board computer which
>> shares its hardware design with the CoolPi 4B.
>
>How different devices from different vendors can share design?
>
>
>What is exactly is shared and how did you verify that?

I confirmed this with ArmSoM. They purchased the original CoolPi 4B
hardware design from CoolPi and confirmed that no hardware design
modifications were made for the Sige7s.

So the Sige7s uses the same hardware design as the CoolPi 4B, rather
than being independently designed.

Best regards,
Jianfeng

