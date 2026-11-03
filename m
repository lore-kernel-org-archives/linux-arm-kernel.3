Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4977606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vSHXzeFe;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P6rUjeNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=; b=vSHXzeFedRmFJu
	UfAcbNkAzazBN/8hgZbkrDtOBKY7Kyq7cO5IrbjjrIzWbKCB++7slbQalDIkFRxxScKcw44OSCMhY
	IY4D5pa3iSFbGtAJX0957Knv30jT9NYsyGzewgAFADAR8Cm1nAdndza4mnTZ5N2K73t6HGEYXHktz
	i93b9PmLeCbMTddvENbVbA//JjgYUb8TLgPSC3m443g6Z3oaCmWidkohcwHQ0wuxoZHzFZJYpze2c
	VDf30B4t9adMzHKaL4wG+hgo9d7v5MwgcJ7OFw85bBnv8VDW0Ohs+j5erdlVQrWGLJWK4+7KrBkHy
	eCuKdiT/sP9s2twJVh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDd-00000001q8r-30RH;
	Tue, 03 Nov 2026 09:54:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDV-00000001q0S-407L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so26442675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699648; x=1794304448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=P6rUjeNwcJWl2AE6HQKH5UqYbwcbRDL8yPKWrpi4FdonJeogS03zOIuH5bN2ayOVfb
         nB9fQ0oLAsNUhCxY45u3d+R/xawe3Pt6d67kKpcKBExDXpcpOSqiXYoBz5Mhk04cZDkk
         jTItOauSnAIHAfhv4W20QFPGHHLpF1x7oi0tfvQFJ7G/Ufzh4XvP6/nK2mN8Ro9vWPN8
         Tus0Vog3y2ZRB3Sz2zeOmpIFPv5mAXiqlW59U6+EPemsjmz3Fh8dmdwFe16Qc5imw3el
         n36zs9alUGgZCFK8SI6jQRvAiQZRj90GpHzxrJ7O2QbPx7qs39JToydgWYS4f4nfMLEk
         +0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699648; x=1794304448;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=uFRFmFRZzRNvJzS9n71lvGCrqFaZEFD364i1gHNNWZFunTRPdS62JsjydWrzXe6/MK
         SaFNDVOWJEoiZFrhmA+tD23CaM0MWOdI/LPGLkljrwFxyP8Qrqp95npSV/YxlC2HAZ82
         wVEBZ7bvkeojO0dfI45yF9L67iYDMX0i8t1bRCBPfOqDkJ8sqkKRaqVu+GzEk/jmFsT+
         GEL+MHKKT4A+AZfamZ5HBoFfvOX/Fl9jZdefgncQfKgNJFvwhjsYe667bi2F23dh1ZFg
         Hz/f/B5emokTpBsUAHGeF0WKGTkCPlL62Z09/5EzaCafL0jJBZTaJn5jPOqElPzJ2Py0
         JwTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgQrFNDLNCO/rnxkh0r7hIBR7eid/AkTE89fc6EVKBtw7f/DbM6IkGV5aZye9HO+vHGza03NboZ4Ox9QSbGqpH@lists.infradead.org
X-Gm-Message-State: APuU4Z8uRXcScbKeEuOJhiY7yRZVTbO5FyvCQojMzfzqEgcrxLDb4Kxo
	KORt3tIsMqtUYK5SBBFDjKpD6X4vQ3//kFZ7SxTh30QoFpJV9wPR54qHV7Z5KdfkzQA=
X-Gm-Gg: AYBFou3B9vDZTBzLnwfySiqyqmJp0uTB9+Ygfj+0SC01avo2c9S5x4+EV6Gb7G2/+C5
	Y+YJu7k8vYA1NJkMSn8SyQjGmB6VPF2hQ4qySQYySXvgb2YRyx6CW2M1k6ePjVWnKB2ibTqg5Xz
	YL3y3YTfeGh0TBDJZudosBrP9OHf/R8/QmnRO/RwGYnzGlgdjy6U8b7W1LysFnGtXgpIVFnzc6S
	zFlX/H4aU93yWK+JbEa4tpaiz5aUSabbE0bjQ0MJp5PZJ8whI0Co8FQkP4DqM2TaWtmsGN+VmLV
	IRc73q7LdmpJV8V59LkT2upNzoGt+/WO6zex3vjPJEaw4HaN2HjBpsXeHk37VyOLvIL3YoOicPC
	wdDutpNY/xCp2aV1eHFR7VrCqC5QIfjkaWY+vPzDtwJ6LTk7df/f5QMtFbUX8iN+z0xvuQ/PMc3
	LwAVgVh8fI7D5sJ33IcaUBIXYfI27nMIcRS2k1B8sQGx7odAuTc9JIGEpGjHuh7RoFrQIpcILnS
	p1hZkeZvwjip+1E5VGLTWJ4fedbjkTzZU29w40/wVS7KSkdzgYGNjLcRMSOtEvJ2+sJfuiID6D+
	GE0t1gEWOy1SubUUoAw4iTuNFd9p3MO2FGcG/Cp5sofktyNA7A==
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr271871785e9.33.1793699647846;
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, Nick Xie <nick@khadas.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 christianshewitt@gmail.com, xianwei.zhao@amlogic.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xieqinick@gmail.com
In-Reply-To: <20261017040038.3702428-1-nick@khadas.com>
References: <20261017040038.3702428-1-nick@khadas.com>
Subject: Re: [PATCH 0/2] Add initial support for Khadas VIM 5
Message-Id: <179369964713.2330120.11723763412614220428.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015410_038815_E1CEAF95 
X-CRM114-Status: GOOD (  14.09  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sat, 17 Oct 2026 12:00:36 +0800, Nick Xie wrote:
> This series adds initial support for the Khadas VIM 5, a board based
> on the Amlogic A311Y3 SoC.
> 
> The first patch documents the board compatible. The second adds the
> board device tree with UART B enabled, an 8 GiB memory description,
> and the ARM Trusted Firmware reserved memory region.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: Add Khadas VIM 5
      https://git.kernel.org/amlogic/c/7db251465d5319a5c0fc46c397ebddb284560982
[2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add initial device tree
      https://git.kernel.org/amlogic/c/56d1180882a32c78a6207b5364e43c2fc546cd9d

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


