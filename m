Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41750C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egOR95e8pzUIXHVjCnVm2bcSsTXIg61tjStS28c2/fc=; b=s/XQflMydfeMNOsbpE4YV2k9+6
	dch/luPLe4WVrdDe1i8K6sH6RdFNsCpvCe72cMFNpfGBDnV0atp732gAY/DiTTGWcN7lNNtpYrSLg
	jtKOix+J8Wu8RWjB19lGX/ixi5ILjKWCF14QrIlfIKE8AgJbFuMDrGMXnmSrX0uxxrlnDD6heZqPw
	/zs1tNcfhdnp2As08a7CwWgIP65CYOSRab+LeeFYWVusd9YbWzad6eieNFouyelvWENV8ZFsM0AG1
	j/aELK6HYJ2RqHrT0Vixk6+ETiiEJ7VW8A4PhzbA06Ulzq5XWeB15jzOZpzqynYwYgoQKr9JH16aJ
	7gMM9rJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejUu-00000006Cy0-3zJd;
	Thu, 24 Jul 2025 00:07:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uej8I-00000006Agz-1fDd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:44:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2350b1b9129so2522825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753314262; x=1753919062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=egOR95e8pzUIXHVjCnVm2bcSsTXIg61tjStS28c2/fc=;
        b=DFFMfs9erTIzxgv8Ey/nC11SjUDmbfOqnu3eaznJQwC+MPt1pTk0vxo2WdrK3SO3cA
         3Q69UuPRCfw+4YW6kl2KM/FFQIByRE277KeTseWVlk4sGO6NzRWTgNpu79fw4dmaHmjU
         Hci3vRUt5NWFMvXPPVqOX+TAukXmwWK/QRbv+enBPr2TUfgA/taqfUsKsJZcW3Ou10Gz
         S9UUroVAXY3y0J91T4vs59ihe/IPebFBkGFyHhgt5iBIsoua0bP2vGctHuvOKyNy3NQ/
         1l3oo1yLkgu2vYsaJKPmbVCphXTuPRZ4J7T/tU6fElbS/rnBNaISoxXRwhHaWjJxUq6m
         TYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753314262; x=1753919062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egOR95e8pzUIXHVjCnVm2bcSsTXIg61tjStS28c2/fc=;
        b=V1Gte1Sr1oazJpkF9bnNE7j70pwxsVuYlgya6rB1XYlooG9crBMuQ3HZMiXbJWvO1v
         aUbN6GlzeR30naWqsAISVbw0rBji+ZVisTUx70cFzaw1nhh0FT/wjn5MSKrr56+Gcdfm
         4CkYzF6/IMF9IJiBu1HXk9U0c9isdGh+YaqhaX+vsJYE8YXiqNTSH0YMYdr5QwKx8NmN
         LW78IAYP7WT5WQTG/J42HR+1XWaZFr9POlxCe8JC9NYsrz0gaquQq0mpzYNUE6onNepE
         +YwoDTJjQ6fXcp4c6RVsnyCRNScEUqV0vYjFy3PmtOBsTUamcX7xFJavN6niWTPX3UOp
         AOHg==
X-Forwarded-Encrypted: i=1; AJvYcCW2RY4nUulemXZ8AfI1UulFkfEd20OGxastd5mxAc5hBnI77bVNSGqXD45HqZiQSb8rfVAthN72SmZd5i+6LRBJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyObf7MVKoRut2V8/cQ9NKwv00olcBl9Rj3466mJ7YepF42fAd6
	9QgC/dzqGSFDVFe6i/EsI7xORdzdQfdqQMixocovh6X5FG8aF3T67Res
X-Gm-Gg: ASbGncvSdKh75RhXch1eL9a3+r6MswwjcRiEqaUvts2lvTV2RbWYxElXpin2QbMrHvI
	cy5jxxbxah+cbkqpr+W18zmk/wiDHasLi6oi88s3L779Z/bNErXEs5SN5Avdo0/YHFH3mbcVk0L
	snsHjK69V6bZRP5ReZ6AhjCnz5zFGJ9kEbZVd0N4L0aNipwkFrhe01cpKVJWaeFv6yzRPx6mTtO
	gkECW1H2WbrG5qLDM82sI+F69R/vZceo4Mk41GBMnsMKu2H59Yl5zR4hi+suZ0U2LlooyFPPDAR
	GykosfIVq+2V6yzXBAN2ENMvdSyjQsdVnNyayCiZj9jOCypyryAFJHtS09wHrLHwh/rkinLry5o
	9DRXCRxmpRIZCODyad3trSUTov1cEoQRIZbOysLHdwwMIKeB1nvSKsMRqVnxjvyR2gh0I6tAym1
	g=
X-Google-Smtp-Source: AGHT+IFDzS99qUj6bsQTcDicde763FDogEGZYIzf0CqpnnHK6ECZzmfcAqK3CJqUDBhhH8jFJnC1JA==
X-Received: by 2002:a17:902:ef08:b0:23c:7b9e:163e with SMTP id d9443c01a7336-23f98164116mr54444835ad.11.1753314261687;
        Wed, 23 Jul 2025 16:44:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa490222dsm1371765ad.182.2025.07.23.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:44:21 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:44:18 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 00/13] ARM: dts: aspeed: Add Meta Darwin dts
Message-ID: <aIFz0nq7qHvzglwZ@localhost.localdomain>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_164422_438575_217F980E 
X-CRM114-Status: GOOD (  14.28  )
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

On Wed, Jul 23, 2025 at 04:29:56PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch series introduces the initial device tree for Meta/Facebook
> Darwin AST2600 BMC.
> 
> Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
> ast2600-facebook-netbmc-common.dtsi.
> 
> Patch #4 moves eMMC entries from ast2600-facebook-netbmc-common.dtsi to
> each BMC platform because eMMC was removed from future Meta Network BMC
> platforms.
> 
> Patch #5 introduces new BMC flash layout with 64MB data partition.
> 
> Patches #6, #7 and #8 add "wedge400-data64-bmc" board. "wedge400-bmc"
> and "wedge400-data64-bmc" are identical except BMC flash layout.
> 
> Patches #9, #10 and #11 add "fuji-data64-bmc" board. "fuji-bmc" and
> "fuji-data64-bmc" are identical except BMC flash layout.
> 
> Patches #12 and #13 add Meta Darwin BMC and updates devicetree
> bindings.

Hi Andrew,

Sorry the patch series grow bigger and bigger, and thanks again for the
review.

Besides, the patch series is applied on top of the latest mainline, and
we may need to rebase when v6.17-rc1 is ready. Please let me know if I
need to hold my patches till v6.17-rc1.


Cheers,

- Tao

