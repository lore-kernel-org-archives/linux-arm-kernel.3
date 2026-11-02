Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E721606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HPANVpo5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vkGKb0LY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=; b=HPANVpo5FZt73GlMLEFmDtNp/9
	I9SKltbJkoDk3LUD9dXU7gJLrkNWI9YHJSlX6mTIxD3e7aLlg+Z/GFWdn2NNqUcRtSv4ASmSkCaW7
	/9qTNZY5jSgDhkhUNee6JrNkT3770TYG+Cff2cpfWmuOsd3RMx/+4iEIriB0/mhkTLNzGJO6K3oQG
	DySYm5rzhklZSRfWGlQevm9NxqKJh6Jy8k+0Ynb/A++HD5vx/NBXXFw3cGoHydIpqOhEw3MEY+Me3
	Cu+PRo2VXQndV2lFPJGPSDHTspdrq4xhoUtUcZjClxLM2PGeCh6xIQsSBZ4pq841ivUA680vWdzKh
	WTUiCAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxBk-0000000023s-3udf;
	Mon, 02 Nov 2026 18:55:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxBh-0000000022a-3OyV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:55:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1691758f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 10:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645720; x=1794250520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=vkGKb0LYrZ1tqBn9dZhnYGN9gRJ5Hy+NS1LaaO4XMw19FLhthxVcvT7J8z4rST0Fw4
         Fupa7Js4Og94Kshsrpwjg5QilENIPxjF5Ne1azaYlf6Yd4FdwznevWZYIkF7Z54MycU3
         9Gjf1QzTgUyHY0pCylcnTYJxSyXjrFl9xM7cMfRW+9x+KN8ATe8cvnLLZHC+ZCWv5U1X
         wCFKkri/pzpMsVXckdha9xUYb3ajw6mfNIAb0Cx9daz4SwOBk0/QIj4cvVgX0zv0jg4N
         ejjf/5rwh+lxt1vzoc0aN2dzLTR8Wtev5bMpkZs0GgorOAE5kILgiy7EmvRBHzNm9axQ
         tspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645720; x=1794250520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=Klxpnvxyh30HvYzOvqJ+pB8DXQsSxo9bhmqtzRa4S4n4Jf+1h6/Z768/y+RryUsaH3
         HSqqLY+EiFsuiEPqR4HtUBC8LJnkVhKEuR68EZUVAIyymhXy7EQjsNoOsHaWnqszaAud
         r97jlZ3NFr6tEeLZKsAGIZAHCfe3kvQzzPupSvUojCgToReJOheNuLdcs5OKmkC4j5lh
         ypeQb7e3AG+N2PadM40vpBaqzw+aMVXPh4sLUVTfS6ub6yKfwbIrN3GpD3Nar/XVUqfW
         I8DDAczcpNsu66qCoBjXixVnsa8rAx5gIjSVKUjPB2usDoiG/IuIBvko5sQQesk27hTv
         KAEA==
X-Forwarded-Encrypted: i=1; AKwUvBysNg82gBA1ZlVAGUDFlkgHXeDk5S4eTeM0m/8RMXCq46tWm3wXNmkXnFBol+5wZyXWIfI6ZiYHSAX7ILjzzGSm@lists.infradead.org
X-Gm-Message-State: APuU4Z+lMQKNw4qP45V8ACMG/OKaLgO6E4nBsZFTDEMCz4SCNLCiM863
	cn3uOewroB+xq1FGh3IpcYvvTI6ai/tgCby9y9gLzHxrfv4e9Z+ZCf/H
X-Gm-Gg: AYBFou2T/W5JlbxOzrLOuHBczPL7muCT8pvkLAah9qSn3fblIpxZF0E6Pg7ttYa3yRu
	9My7PSE69tilbjjztoWny1tXfv2Mez+C5uAtzSdKL7UiQL7z2GltCSBkz4fdiKK9o4Cqd7+SadU
	kdscatigEMnv9RT6P1qaam7HB2EML2lX0kopvgVqtCbfe3iIAlVm+w0U+yzx3f+vZ3SeyXT8XgF
	5oSspL+UJAgZlNDXftcBLbWbhO6326AK/m+geR7CihBkQGZbsddSHIDcbQVZLn8FOKogBOxqJ7j
	uswJl2x1OM4E+oj52UMXyZODwdFI5nwA00tPfiTjvzwXNTrlvkHDdz/DkINTDf3M6W17EpfC9Hv
	ebz2JhL0RTpGJGqBTodd5J7LWNjuHMU8QYHf18ytOMtOe+f1HT1VDAsA9JO2WNav4IM67m8KMlo
	l4CNomc4tPUJdHdjBturfU/cR0MrYkpoJSCLY7BFSBY6yP6moBitU1f2sTVMdVp6lGrHaVE5NeG
	2T2reIbHXA1HXhfIheJjUviXBDcRfzICqSQv6cio8TpzrxsNIoZAdmC8FKydOEdn2IBsieGRUHR
	nO0TV2rrXXUt0cpDT5OvEvpXCOrf5LmZlPoC8jH5mr6RVHhtvy4AzJFL9DOO1eQKQdPIsm/jk3P
	MjTLgqir89fqMj0Ind8X+3Tee/uxx+gH25CC8KuHejr7DaqNBdszY0A/vHRRKFuNS8LQ8C7pb/g
	==
X-Received: by 2002:a05:6000:4021:b0:48d:e6f6:21cf with SMTP id ffacd0b85a97d-48e6e306900mr25328622f8f.31.1793645719465;
        Mon, 02 Nov 2026 10:55:19 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:17 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx93: enable UART wakeup on Variscite boards
Date: Mon,  2 Nov 2026 19:55:02 +0100
Message-ID: <cover.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_105521_880680_940DD1AF 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

This series marks the LPUART1 serial console as a wakeup source on the
Variscite DART-MX93 with the Sonata carrier board and VAR-SOM-MX93 with
the Symphony carrier board, allowing console input to wake the system
from suspend.

Stefano Radaelli (2):
  arm64: dts: imx93-var-dart-sonata: enable UART wakeup
  arm64: dts: imx93-var-som-symphony: enable UART wakeup

 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts  | 1 +
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 2 files changed, 2 insertions(+)


base-commit: e20daa6eb46fdb339be122a37211aa408488a3e3
-- 
2.47.3


