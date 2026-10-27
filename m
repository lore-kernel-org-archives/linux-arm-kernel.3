Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BAC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j+B+Ir5y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PS/dU3L9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=; b=j+B+Ir5y/LRgK4
	+h9mvifnTia3CXXemR5AoJWUYEx+A9X990b8HV+bABfjwXsMAzcSadCbECvXpXuiADBgFNSuCqyb/
	rA8G4aeFJM4i2jmgxrzJz7qW6lvzLMmTP94pgaFnQvESmDwTqHvwTQI9AM9xDITvQzd59rdEBrN7k
	qRla0HV07mgg4XgcRo3Rr/2VMyTHk74ACDlajQD5lHbqPbet32yKCzpEEkGSjS4syVHPSEpdkt02a
	kBW+XhvHurGXhvN28uIiH3MHzc8oWnscHkT9u9ahbVA87sKnDy/SiTmw+MnJPWbUCSphlHrjPafqU
	YoyPWSIgkp5nBJBxcCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLczG-000000046oR-1NbH;
	Tue, 27 Oct 2026 08:56:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLczD-000000046nO-2C5W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:56:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e74a32a07fso4093195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091410; x=1793696210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
        b=PS/dU3L9VB3RAPeScmiOHekx874iP8F2ERGb6VtSIRm8XufUqOrAvnFIwatAx7Kd9+
         YSuNFKGGT86stOLCbaBOQUYP7Exw9lEn/0CcsJCua7avCQbJ1xhFHg4fhxUyn27vFzL6
         CJ5nhdFswax67vNC80rOLmABUrm9qKgM3wCmPgWb9KjSymmVgd6dAjrFWc8j9byBHjvc
         ud9WWMCJyDUJvn43Ex/dNZCLGfkMV9ld75Oq1M3QbaTXcLkKN6bogSDDUr/JxRvJHv03
         u8AgO7QD+/+Od6vNAYL0AqpFYvqNwOUttDmoVa8YHkeYkqdyqeu6N2hPp2SfZDFYtMAl
         yL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091410; x=1793696210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
        b=vO01BV4L3rc4H4vFcjsJA+QNgMgyG/AVKjjUIDQgwlSt95YSxGGLzryN7M5fHhbXrq
         9JGfm+u+bJa1j9c1ks7c/b5tMzvB+3UVtHvJSLi5Udwy5DqsFBbZD8z99DI5Ru3bC2t2
         +goBDq43OXfqQ07oT1VK20y7OPtwwrhCybgQE+dHjLpYypLt7LexYMAuwCagoCJXncCJ
         YtI00csta9QYLzRTb62ug5Ryibt4pNOkryjAbm2vBlJKiYBiNrBIMqiUkqUrDAw4C9pw
         IEqgNRWINhSIT7yqg84dUvKUADwj+BYYgo8z10I/wmNZ4jWW0mr2cPEM1YXR419mHrfA
         fZIg==
X-Forwarded-Encrypted: i=1; AKwUvBwszYzEwA80HJSXiPvx35CL0k6HC7w0vE6/mY7wS31Y0pp7TrQf+FnMHPLoxFVylfgJ7bR2TSZk+KC//foRxPUW@lists.infradead.org
X-Gm-Message-State: AFq9FYJmRHOXqdU4aG9VSQclEYqmWmY7yRVjXM43zwanVctimFQ0XHYh
	ORuCh39nwN/QxDXl7wkklvQoJJHKuyKe1T2fgeERXsaPb0EvtAbxF7op
X-Gm-Gg: AYBFou1Ysh6dC5v9YzDmmoYT9dkhTr+9yMVgx2Vun6JIvj6+SugHtKwnPuQ8CESNe0Z
	EsZ6TKydnRY+3dDu3j7QU/ynn3trfV17xZFRGCGUbRhdiULJr5/l9CeBN9l8Ws3foUejJ9rbvD5
	jjgOH8Ul/Om+VEaOe+E0SQitd0/lV1vutoseur3rm/+brKTPr5VtsGyvHm8JK9uNLfk/N3XexSK
	Sxuie8uWQvMirVGZ3HPx0vHREnVqlPTeHsIzC1Qhx4kKiw7gPd4bXhmoYDKo7UKY+J6Bd/Rle2C
	A0DRE76dBMIsaf7AiGcN6udYiDqhiyitXjfYko9XxBSeJR7H7Lq+fwH71s++BODHjnaKrGv21+m
	GQVqw2pJ0OncVYHwwzVSPj0+61GjoFmzD5DTbmOMdUhvmPdirMTZUYPnaYitj46X5MeQJDmDT4v
	qG/V+JOVAzOGc9bL6E9hyi8L0lgDPBU9bIv/Ki2EEXmbAUk2Yhxz0EIDzwb3czE7n0dWRsP6mnW
	hRoVrq8oEvTp1c4Lqr5nuNkuURvn8c+fKJ83zWy/DrE1P7Npj0ZZAogYz8NmdRdxVBXC9G1PEw0
	/kQipg==
X-Received: by 2002:a17:902:f70b:b0:2e9:4175:306b with SMTP id d9443c01a7336-2ea9c08b095mr121636605ad.1.1793091410353;
        Tue, 27 Oct 2026 01:56:50 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c91e1bsm5623875ad.59.2026.10.27.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:56:49 -0700 (PDT)
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
Date: Tue, 27 Oct 2026 16:56:34 +0800
Message-ID: <20261027085634.380872-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
References: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_015651_559881_96FE8B88 
X-CRM114-Status: GOOD (  12.81  )
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

On 2026-10-27  7:48 UTC, Krzysztof wrote:
>Maybe just install the DTB under new name if they are identical?

Thanks for the suggestion.

Installing the existing CoolPi 4B DTB under a different filename would
solve the DTB naming issue, but the model and compatible properties would
still identify the device as a CoolPi 4B.

This is my main concern. Users running Linux on a Sige7s would still see
"RK3588S CoolPi 4 Model B" in /proc/device-tree/model, even though they
purchased an ArmSoM Sige7s.

I agree that we should avoid duplicating the hardware description, since
the boards are identical. However, I think preserving the correct board
identity in the device tree is useful, especially for a product that is
still being manufactured and will receive ongoing upstream support.

Would it be acceptable to share the entire hardware description while
keeping separate model and compatible properties for the two boards?

Best regards,
Jianfeng

