Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4559DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxXmArkr7I9p8OzXN7Q07cbSHLBGjb9XXJaQk/wXaiQ=; b=JNSpbR9kPbhHiN/zZPr0rdjzBs
	RRsuCvzFgDAGiniuEQBGpnJpoXpO9PqWAIIoYrShwDSvCfk0U44/iDpqFXf+oah5bNcTq7xPybXVX
	8TeIGBqOcWvPb8fBialF+dQjnPHdMTDFS316V34yYkPx6sXS7oxcWnwjq7lN9TUJHfeDVgV+e4KJh
	nuULPjvnNLcJERBKbFQI2ASDdbsZbZ8u2LiXp+sY/iMsgXrJAkrgC9+MWN0LBw71fxXkg/R8KhA3w
	m8QqHVQaNQTWhm6ZUxiQCQ7PQGv3wCYdvy//kN58r1GBlfTncNtX+vi0Vgt7wrfOZfk9YqRhEijQ0
	vUfSqaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo02q-00000001FLl-0TAS;
	Sun, 26 Jul 2026 14:41:36 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo02n-00000001FLO-0MtK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 14:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1785076890;
 bh=wxXmArkr7I9p8OzXN7Q07cbSHLBGjb9XXJaQk/wXaiQ=;
 b=cegTEO+Tqw1ZSZXEp/iNbfGtaT7CKyclH1VJZvowD8BsnKn8izc+3x48373YcNPz50YizUIA7
 gPQQoDzPUv3CFr2rRhAxd+5OOZvNiH37I3+hILQ3kNPXHdF4qSt/pqR+J+oA4hh/sTUx6fq58fM
 anyfIQK538B6ETuSE7co6FR089UzVlK8ABl0YQ1VkRG5VIfj8OiqDOX+bgJHC1wg7Zmv7fKQ0g+
 8UuruwXIXSKsAVuGqZhEGUdlNSnIAFl9wDShRE+r50MlVwV/piB+Oby0h0dlAL4JcUIHLxu4mh3
 oHBfGnI+8LkspO0kqt2uwkySgkNt7oe0qRlUVO0wGRXA==
X-Forward-Email-ID: 6a661c98d1c8002293af8ddf
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.12.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 26 Jul 2026 10:41:27 -0400
Message-Id: <DK8KY15BK9O8.382YX2M15Q0EQ@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] dmaengine: apple-admac: Add support for M3
 generation
X-Mailer: aerc 0.21.0
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
In-Reply-To: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_074133_497908_62F13284 
X-CRM114-Status: GOOD (  12.20  )
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

On Sat Jul 25, 2026 at 8:25 AM EDT, Sasha Finkelstein wrote:
> The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
> additional register writes in order to function correctly. Add a new
> compatible chain for those, and change the driver to do the write.
>
> To simplify the merge strategy, the device tree entries will be sent
> in a future patch series.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Sasha Finkelstein (2):
>       dt-bindings: dma: apple,admac: Add M3 generation ADMACs
>       dmaengine: apple-admac: Add M3 generation ADMACs
>
>  Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
>  drivers/dma/apple-admac.c                              | 32 ++++++++++++=
++++++++++++++++++--
>  2 files changed, 38 insertions(+), 4 deletions(-)
> ---
> base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
> change-id: 20260725-t603x-admac-a1b07a2ccb54
>
> Best regards,
> -- =20
> Sasha Finkelstein <k@chaosmail.tech>

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

