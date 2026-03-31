Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D261FFF60D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjCEfnJY0UWGMHzo/rmIFjXS2kL6uhfSt06WAzQBoZY=; b=eN2X1RE2zw6QszDx4bypVsRFrv
	7DjEOkmht6Ck7akLxsmbOifWqDD/uIOcciAaYQvgcJxFPu4PdAMNP+oWKxIdR188kKPNZ7uLgvEhM
	V3b/4HxDW6ry5wBBEPNXcjg70qZzP54FBDAxNNJZxTiC8vqEHW+VCJFpa1KdxTz7QgB6WU7a6uDoo
	Nga5wnEmvxDyVu9kowFqB/r9FF6tJu9LhBRLU8Zfkq5kYk0SgsxxNlGLI/cAa0n06QDUaOmZkyOs3
	ZndzkSrbB2YJ5JPmINeBUf2HHBNcde/DDT9Pj66agu7DlZjd+P2U6GKo+LZuUVeE/Zy3u8m3CXPoH
	+wQqdJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TQY-0000000CTBr-23jf;
	Tue, 31 Mar 2026 07:22:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TQX-0000000CTBZ-38tP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFA0C60133;
	Tue, 31 Mar 2026 07:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F43C19423;
	Tue, 31 Mar 2026 07:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941736;
	bh=cAhfPY2nlrEvbPh4MsPAlD8tOnaKqYTDsn/2Pmn3kAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ml9Kx8FfN1P7y9DKSLbTjPNUdC92APM15X5WMz1zjiaCDxeK10k+DSBoZequrmuxG
	 f2iYYM0UYsxnpEl5vjRL9nl9hkaePvauuRz4Hgcw49ZL8Btnt5LPVJhptCXq2atX/5
	 /xXdJ9mtVy+FO+6pRAfisFfp+Fxx2dTEIJUKaZADCyhU96oY9V/Nd+Nwoy3GnVIMP3
	 edDfr2FlXQM/gEBvzjLaWtw3/QLr85BvkhIfko0hvqxjEXYgjRQcDLIgMyINt/k196
	 WRLRZjZGV60A/5gaFwU6aS6ALFyzx/fpopdlRy1XF5kBaMJkRFduiPx70+ksNcWXVF
	 d6MYgj80iSItA==
Date: Tue, 31 Mar 2026 09:22:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ulli.kroll@googlemail.com, linusw@kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: power: reset:
 cortina,gemini-power-controller: convert to DT schema
Message-ID: <20260331-acoustic-rousing-lyrebird-ab3cfd@quoll>
References: <20260330110135.10316-1-khushalchitturi@gmail.com>
 <20260330110135.10316-2-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330110135.10316-2-khushalchitturi@gmail.com>
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

On Mon, Mar 30, 2026 at 04:31:34PM +0530, Khushal Chitturi wrote:
> Convert the Cortina Systems Gemini Poweroff Controller bindings to
> DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


