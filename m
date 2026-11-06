Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A320C606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EIkd8Z5g;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgMOiEkp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6TKu6N+rhcGhq3Fl4eGSM3fARudAqk/2MFphQxFlg48=; b=EIkd8Z5gqr443W
	tSCUSFrliSRMEpq4yb3DQvI4w3sFshl2EqraLm3AboX+fVgwBxsRImm9v19CaQ6M7/7WAKmSTHdda
	HNVzvuqO11f7m6sVRLb+Lfi7GmPWr0MUrz4GfleT/hjSzMYX5+K/qcGzkD4RKEwa4Pb6aGxBdKOEr
	fGgovKTj3+C/JGiMgLRxWLaOHH1C+5NYQ3+bENILOP4fBX5xWms26iuSypoVIeXZPcKZVqKjMzPoV
	kl8tB6VRLKs79+68F4ySnugg7ygqH5OUop8cY9jOWUbXpzG6/B96EzUV9xcN/eZOTejJLpZgTvW6M
	9OFZ1c7bTmZ43VtSM0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGwe-0000000BsFg-1we4;
	Fri, 06 Nov 2026 10:13:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGwa-0000000BsCW-044k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:13:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2929265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959990; x=1794564790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TKu6N+rhcGhq3Fl4eGSM3fARudAqk/2MFphQxFlg48=;
        b=DgMOiEkpaPJDuLdWSVRLIuASr+Mr+DAbU4qlRyRIqc3CxuaS5gmCVvBNsgl5N5Qzo0
         57rlfVv/FM7O/v02J1e/GHD8QsPPzBkCEsWQeFUT9OV/fyq/gjBALy4J+8a6wNv/XcIZ
         adch8wOJ+668cWx0RcNEG/R7jHAPh9wPmeFtRIxZWyNkAMd82RO2fxHPzVwy5pu6vnK9
         SrswpL4Wv+hfzZOFTyaA6fJafy76Obl2Dx1S9uCTKkmxSbuX5/QLw/Zi0RZ+aA2sw9Y3
         V3NKh6H/GzvJ+0vtEcrToLtvsD5Qx45DCSdwhqrVU6uWse4iN5EKFCEnjNAYIqHM9g7p
         AAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959990; x=1794564790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TKu6N+rhcGhq3Fl4eGSM3fARudAqk/2MFphQxFlg48=;
        b=FYLqd2Ghrok2E752LjWYOdVBqwTKHQSrQZy6G+XRNTVfrwR2ElguWP0px+ffH8hl6v
         pXSxqO0y4z7f6gPSP8uXB761cQV5i+dxNCq04Kv+36pnox3Opux8oZqcuuyyx3rwHVGn
         UdIIWuf+K2zomEzHXJ5GmbodjJvc0+pX9OJbzlOPc/g5Iv4xsTGChmPe43k7Dk3ORxYv
         niTzReKKbSSiOsrtZBmhZzvsUtOMwPJ+AtIsjZl0N5FWcSUGwWaDQXjmWNcvR9/HWNrm
         r+bhdraLBPPziDLJF3XAeS6YmpqulOcugeb1DrQPeE966DIu0wbCO05CUJfUY5xrM9GK
         Rkdw==
X-Gm-Message-State: APuU4Z9Gv2D34LiGbqOqaRxW1z40+1BMug77NMnD05yA7EZL779HUv6C
	P6SCJvBSj6oRwm1XTBtRYGYTF4uSAwlKGrqI/JbV4WFSMdeHX/BUuSIi
X-Gm-Gg: AYBFou0FGUg5V+V3cC7wsvnwtbE7uW7mdHAWt13E+ko2BNyGvOxdLYBDZmEHmAYD9ZT
	eZgGDePzjnRKUhtAWXFJQbFHfT39UJ7h/UPK+0Bztyv97S/mpNIO7EHM5zHvJRp7vRqqAbFW3SU
	i14x4suCch5XRCnAfalh3fddX9F3ShCfPUiCzDU0LIm1voQfAjVDNpmVJkoqJbFJ1PL4eDBT9XO
	8Q8uPn3mtAX4qWRNLmP4hcHb0Wp92JC7m468wjwPTMjN1yTCdWIki7AhWqFknyTdijDob/aY4zD
	h2EDokzkdIfb8Uon/KSagI8AOpTQi0MVI3lwEB/+eyGoKEVF32O1HvliP+GdMXGD55Ql1Rr6QIt
	Si22TXKnrIngZ6MQs/F3Gsi9vqo9dpbvt4CPtVbXGOnu74g6W5apEr340AzqolpctLXMlVtA18l
	ru6k1RABsP6Po+ADC03AFJW1pseG84krp2UorzfcJiM5g31glBs8gGiXth+klD5IHkiQYHpuXSn
	xV4O1PStnsZ+NUuBzA8d0rBBzR/nvf9yia4LT1cBOiEW9ZuIjzTm0iQoLRLRXnuPJImWS9zaWh4
	i0RAbKnysr53i/qQGSqVSnQ/IqgexHtR0fw=
X-Received: by 2002:a05:600c:8819:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4b6db2ba2ebmr27307405e9.1.1793959989827;
        Fri, 06 Nov 2026 02:13:09 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm2934846f8f.32.2026.11.06.02.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:13:09 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 11/24] phy: zte: Add ZTE ZX279128S PCIe PHY driver
Date: Fri,  6 Nov 2026 11:13:07 +0100
Message-Id: <20261106101307.3936492-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261014072109.1759502-12-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-12-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021312_056436_73F25B27 
X-CRM114-Status: GOOD (  11.17  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Navid,

On Wed, Oct 14, 2026 at 08:20:51AM +0100, Navid Ghahremani wrote:
> +		if (i == 0 && port->has_cal) {
> +			ret = regmap_write(zphy->regmap, CRM1_PHY1_CAL1, 0x00202d5a);
> +			if (ret)
> +				return ret;
> +			ret = regmap_write(zphy->regmap, CRM1_PHY1_CAL0, 0x0046c24a);

On my unit both read back 0 after boot: there seems to be no register
at 0x1b0/0x1b4 in the top CRM. The vendor kernel writes these two
values into the port 1 controller's "ctrl" window instead
(0x09600000 + 0x1b4, then + 0x1b0); with this series those read
0x00203c78 / 0x0c46c24a. The link trains anyway (the MT7916 enumerates
at 2.5 GT/s), so it may only matter for signal margin, but as written
the writes have no effect.

Agustin

