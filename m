Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248FCCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 19:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Fcjd+pXPd4M1iVxV6Lw9ajddAAe4W/RLJsICU+bGRA=; b=w24NJe2dxH4+IPekWtoV27gebj
	uQTAlnYFfPSAnm5cAxhCiauBKWvrtZoCwGSpAUfQa6kiySKLqSL0cZcwSOLTIkaaFGlCBtsuNI6QO
	JXf+ZLntq941IPz/pycOV0gRFaEsQ/6a6xynxjfu4gGTyR37iyPlceiI53h5sGDZlh2WDp/zTqmu1
	tWDiEUX2IDrEOjrM8iYUpXQcS5ar0HF1EwvY9Dv7wReqaXb4bAQT7Nqbg8udhpYOAZcZnBh5pHJlf
	4e754PvNaTqMI6L/QcJd/LnmpBnb2ADCQpxnpZ+31jJ+ftEmNW9d0sk6uC0KcBCWOmsK+M91R/OOe
	dzXKyaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKG5-00000004gjM-29TU;
	Wed, 27 May 2026 19:49:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKG3-00000004giD-3phx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 19:49:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0C8D43C47;
	Wed, 27 May 2026 19:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFBD1F00ACA;
	Wed, 27 May 2026 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911378;
	bh=8Fcjd+pXPd4M1iVxV6Lw9ajddAAe4W/RLJsICU+bGRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jyCA1TJDMWugJyuJEF1wtTrw2DnatynP+Zug1zW35MuKOUksJE075ExusIuAUspUF
	 vK7jXWKGUNC7bNuckVCn1KM3Wk/77PwNYg1hjQpMWzS7vyPjznq6vvDouqTZH2lNLL
	 HiUqosYN05DW0O7TwZP4aTMELdazoS41LG9dhH7DXkDvf8uTcDo+YW/ILd9Fm9uti+
	 eQfev0y9rz26tGEGtgM+X3T0lS/HHKMaYOcMVDssquizMnMjjuv9mfI+9tPRIiUZvv
	 qefEDBe7+IeaR+RrRRyqB8+2Y+WW1O7UHYHXsndY0F2sy3AzXtA7Vx3N5sxSoeU+9+
	 latHNtUg6kviw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	lukas.bulwahn@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Gyokhan Kochmarla <gyokhan@amazon.de>
Subject: Re: [PATCH 6.12] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
Date: Wed, 27 May 2026 15:49:11 -0400
Message-ID: <20260527-agent5-item019-arm64@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526192440.81431-1-gyokhan@amazon.de>
References: <20260526192440.81431-1-gyokhan@amazon.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_124939_973361_F8E688D3 
X-CRM114-Status: UNSURE (   4.29  )
X-CRM114-Notice: Please train this message.
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

> commit f458b2165d7ac0f2401fff48f19c8f864e7e1e38 upstream.

Queued for 6.12.y, thanks.

--
Thanks,
Sasha

