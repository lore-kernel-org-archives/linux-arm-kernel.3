Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA2606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=puGe2nSX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILmuMvol
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=; b=puGe2nSXhYwfaw
	heGuhT/DP1wztAuh9oZjfVYUSBYA+jHt1l8MQOeM+wkkbd22jZRFK3Xm6jbGxYMW4IvEsuFGKK6Bn
	8Mcn1Lg+/Sdo94SbeaZQiCOpM3s9KpGR/8mhbgf5K7TQm034cQv/Io+/ENZoncFJQYYZji8OgivZ7
	kxp+Y11KVgHOGjLDOlyDozKETpzHJlVyniJkvUxpfmEcWBTLawcdAGG5CDPAMGY5BTvceI9AYgTFS
	9mFTldJJiNxAXbTH5AebHg+EMRfXGyKZ+NhqOHK3T26dsIpi3ruljoxAVeTsXGP+fwfHkSCHWF9g5
	Cq2/V64xW/i3ual+K2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8LQ-0000000DJXM-0YWH;
	Sat, 31 Oct 2026 12:38:00 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8LN-0000000DJWz-09M9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:37:58 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1a3c08d6928so2077017c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450276; x=1794055076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
        b=ILmuMvoltqqqddIi5V+vtBp6frfSnTM/2vA5TcOs7bJm9vFFryoa+UPCr8EuU1++pw
         zuK7mwtU1Gsl4qhA51sFbd16iEpIALLiqC20/mp6iDMhlgSkPxAWRicf4eofeLglrHDZ
         +CfJUVqIN0lX5AExcwRyEfjiNBC7s/ySXysVeD7kjjMLe3Tts8lQNVZMfAN7/2S9DLbe
         2Xu3R8QMw/N6miREFJjiMjdvDPTd6Glig7Poowszy9oNQgVrKz+llFRrU5dT0SQ0FAt3
         eMr4yXy9YbEIZut6TfJFfR22qjjLDrTcebbEErWJKgQWUS5LWcAaFnMkAWJHg65W1ush
         1a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450276; x=1794055076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
        b=kTC95K6eQIt29XuEsS+Y9aoFUxLc/l15uNl3I/8E5VTHKw/A+jw8I3n+0uLhM4wseu
         c6RpifAEHZBw0TfeSUfc+P1UU5XwMNeJ5eeB7kzjMBaxjxm5ZiikHM4sG66x7O2j0E9U
         McoukIuypdozf96J13OVdj1QchD8A/SwNTjXiZtuSJVxq98mTsFDN28OunzH3vnKWmF5
         vC9GAsJv4nn5nWroEUXKPR57XMV+lXm8IXGvkFS0qE5LycVPDQlXy7gHrEWZvjwoN4Qj
         EWfWAwVtVYPpekPM13j5sBUg9rs0sXaEUk3TMwQKeUOCdUQtrXYiIRzWbkd3aXEMTnqY
         wpqg==
X-Forwarded-Encrypted: i=1; AKwUvBzMO+XZSB3Xy+6/tcfcBbI3b7dE4CtJVCRHAYFSwCoxWx1Y6A8dHVwL8RlPPZHzo/+crl0kSOl28BJ7KAk2Pwki@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/KECZ0KXJVTZnPrL/JLJSpsQfZ3n4KNzN2ZdtBKnI0/DI02hG
	7RLx81YOLPHVcca6SWPcbneoiIozEpiuzAajYWH0pWHBxajRHh3CXGAP
X-Gm-Gg: AYBFou1K8FSOzN5pdQslfWy11BNEfbdGMTl6XDnkpXIYHPyOtfy0i3IPrI5xBgwVCrC
	ip20btVtCUzfmR7YUH8WdxT+Xjl6v0wioB+NCu5NuNpOr5P7C7luOJzN0DgiqXO495H4m/SfI3I
	rZsBDNG8roWcDzfsZ018T9AHlTgL7+jAV7WS4NJFvZAOqIxuamkcFraa+cp8myRuZXVW6tgr4oK
	+lZQEBUjeY4VLZdYRLYqI0dDle7FsZRHJ8bAwIuHoF4PVfuoASIyyMnBOOV8OBhUqdMSfykTeda
	q+1ZfAPqw74rkNucQ6sH3f0OtbVzmOTbwE5tfj2Bi4Eq/D3xiH2NNAfGNtSFFhORNL1rgb3cuFq
	ACfbmjvo4p1J58K07w7mPZvRD12tRceDJPr+Zmkr/Aw6p3cqgC2RbA/6ILuNTTjy9LaXfLrCO4A
	gWbaSzS13W5INexXgikx4q5Bv18H6ANDway8gYfUwb/YR1cIQL7zql+ItAgvqag2lA7higa1dxe
	nXdA0J1V7Fn3pK9WMaH+B7waGLo0ZYeftBUCKOfQ8WgN9slv/eTZxx/JE3ZvPJGwDuXNPpyuU1Y
	y8+q1CbfunlV5q89HwIUHkvravmuWO+nGreeXA4OEA9H0iTma/ym0/gS58h46K5lWbOuLlHX1WJ
	sKw6f0hn8sQ9W0RAe7veo3imXyGG1lE9bI32cq92dHs5NFw6xO04p2oMkyNREMyGHImQnB4meA4
	ylUHmRQam5+9GvvgjlJVykqM8jR0CSn0KGMio=
X-Received: by 2002:a05:701b:2094:10b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1ac5d69f68amr7196755c88.36.1793450275760;
        Sat, 31 Oct 2026 05:37:55 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:37:55 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] serial: keep the flushed TX buffer mapped until DMA has stopped
Date: Sat, 31 Oct 2026 12:37:47 +0000
Message-Id: <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031005425.3351240-1-samarth.colleges@gmail.com>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053757_099158_D05975B0 
X-CRM114-Status: GOOD (  11.78  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series addresses the DMA buffer lifetime issues in amba-pl011 and
fsl_lpuart reported in the parent thread, where flush_buffer() unmaps
the TX buffer before the terminated DMA transfer is guaranteed to have
stopped accessing it. In fsl_lpuart, the buffer is unmapped even before
termination is requested.

Since flush_buffer() runs under the port lock and cannot wait for DMA
termination, both patches request termination while holding the lock and
defer unmapping to a work item that first calls dmaengine_synchronize().
The TX completion callback leaves the cleanup of flushed transfers to
this work item, while shutdown, and suspend in the case of fsl_lpuart,
waits for the work to finish before releasing the TX DMA state.

Both patches have only been compile-tested with arm64 defconfig, the
relevant drivers enabled, and W=1, with no new warnings. I do not have
access to PL011 or LPUART hardware with DMA support, so testing by
someone with suitable hardware would be appreciated.

The imx driver also needs a fix for the issue reported in the same
thread, but requires a different approach because its TX completion
callback unmaps the scatterlist unconditionally. I will send that patch
separately.

Samarth Narang (2):
  serial: amba-pl011: keep the flushed TX buffer mapped until DMA stops
  tty: serial: fsl_lpuart: don't unmap TX buffer before DMA has stopped

 drivers/tty/serial/amba-pl011.c | 54 +++++++++++++++++++++++++++++++--
 drivers/tty/serial/fsl_lpuart.c | 53 ++++++++++++++++++++++++++++----
 2 files changed, 98 insertions(+), 9 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1


